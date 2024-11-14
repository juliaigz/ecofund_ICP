import IcpLedger "canister:icp_ledger_canister";
import Map "mo:map/Map";
import { thash } "mo:map/Map";
import Blob "mo:base/Blob";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Error "mo:base/Error";
import Nat "mo:base/Nat";
import Bool "mo:base/Bool";
import Iter "mo:base/Iter";
actor {
  type Project = {
    principal_owner : Text;
    project_name : Text;
    categories : [Text];
    project_description : Text;
    project_images : [Blob];
    target_amount : Nat;
    target_percentage : Nat;
    donated_amount : Nat;
    is_visible : Bool; // Indica si el proyecto es visible (true = sí, false = no)
    instagram_url : Text; 
    facebook_url : Text; 
    whatsapp_prefix : Text; 
    whatsapp_number : Text; 
};

  type ProjectId = Text;

  stable let projectsList = Map.new<ProjectId, Project>();

  public shared (msg) func whoami() : async Principal {
    msg.caller;
  };

 public query func showProjects() : async [(ProjectId, Project)] {
    Iter.toArray(Map.entries(projectsList))
};

  public query func showProjectById(idProject : ProjectId) : async ?Project {
    return Map.get(projectsList, thash, idProject);
  };

  public shared func addProject(idProject : ProjectId, project : Project) : async ?Project {
    if (Map.get<ProjectId, Project>(projectsList, thash, idProject) == null) {
      Map.put<ProjectId, Project>(projectsList, thash, idProject, project);
    } else {
      Debug.print("Operation skipped: project already exists.");
      return null;
    };
  };

  public shared func updateProjectById(idProject : ProjectId, project : Project) : async ?Project {
    let existingProject = Map.get<ProjectId, Project>(projectsList, thash, idProject);
    if (existingProject != null) {
      return Map.put<ProjectId, Project>(projectsList, thash, idProject, project);
    };
    return Map.get<ProjectId, Project>(projectsList, thash, idProject);
  };

  public func removeProjectById(idProject : ProjectId) : async ?Project {
    return Map.remove<ProjectId, Project>(projectsList, thash, idProject);
  };

    type Tokens = {
    e8s : Nat64;
  };

  type TransferArgs = {
    amount : Tokens;
    toPrincipal : Principal;
    toSubaccount : ?IcpLedger.SubAccount;
  };

  public shared({ caller }) func transfer(args : TransferArgs) : async Result.Result<IcpLedger.BlockIndex, Text> {
    Debug.print("-----------");
    Debug.print("Iniciando transferencia");
    Debug.print("Cantidad: " # debug_show(args.amount));
    Debug.print("Desde principal: " # debug_show(caller));
    Debug.print("A principal: " # debug_show(args.toPrincipal));
    Debug.print("A subcuenta: " # debug_show(args.toSubaccount));
    Debug.print("Finalizando transferencia");
    Debug.print("-----------");

    let transferArgs : IcpLedger.TransferArgs = {
        memo = 0;
        amount = args.amount;
        fee = { e8s = 10_000 };
        from_subaccount = null;
        to = Principal.toLedgerAccount(args.toPrincipal, args.toSubaccount);
        created_at_time = null;
    };

    try {
        let transferResult = await IcpLedger.transfer({
            from_subaccount = transferArgs.from_subaccount;
            to = transferArgs.to;
            amount = transferArgs.amount;
            fee = transferArgs.fee;
            memo = transferArgs.memo;
            created_at_time = transferArgs.created_at_time;
        });

        switch (transferResult) {
            case (#Err(transferError)) {
                return #err("Couldn't transfer funds:\n" # debug_show (transferError));
            };
            case (#Ok(blockIndex)) { return #ok blockIndex };
        };
    } catch (error : Error) {
        return #err("Reject message: " # Error.message(error));
    };
};

  public shared({ caller }) func getMyAccount() : async Text {
    let account = Principal.toLedgerAccount(caller, null);
    // return debug_show(account);
    return debug_show(account);
  };

  public shared({ caller }) func getBalance() : async Nat64 {
    let userAccount = Principal.toLedgerAccount(caller, null);
    let balance = await IcpLedger.account_balance({ account = userAccount });
    return balance.e8s;
  };
};
