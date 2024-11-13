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

    type Tokens = {
    e8s : Nat64;
  };

  type TransferArgs = {
    amount : Tokens;
    toPrincipal : Principal;
    toSubaccount : ?IcpLedger.SubAccount;
  };

  // stable let projectsList = HashMap.HashMap<ProjectId, Project>(0, Text.equal, Text.hash);
  let projectsList = Map.new<ProjectId, Project>();

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

  public shared func transfer(args : TransferArgs) : async Result.Result<IcpLedger.BlockIndex, Text> {
    Debug.print(
      "Transferring "
      # debug_show (args.amount)
      # " tokens to principal "
      # debug_show (args.toPrincipal)
      # " subaccount "
      # debug_show (args.toSubaccount)
    );

    let transferArgs : IcpLedger.TransferArgs = {
      // can be used to distinguish between transactions
      memo = 0;
      // the amount we want to transfer
      amount = args.amount;
      // the ICP ledger charges 10_000 e8s for a transfer
      fee = { e8s = 10_000 };
      // we are transferring from the canisters default subaccount, therefore we don't need to specify it
      from_subaccount = null;
      // we take the principal and subaccount from the arguments and convert them into an account identifier
      to = Principal.toLedgerAccount(args.toPrincipal, args.toSubaccount);
      // a timestamp indicating when the transaction was created by the caller; if it is not specified by the caller then this is set to the current ICP time
      created_at_time = null;
    };

    try {
      // initiate the transfer
      let transferResult = await IcpLedger.transfer(transferArgs);

      // check if the transfer was successfull
      switch (transferResult) {
        case (#Err(transferError)) {
          return #err("Couldn't transfer funds:\n" # debug_show (transferError));
        };
        case (#Ok(blockIndex)) { return #ok blockIndex };
      };
    } catch (error : Error) {
      // catch any errors that might occur during the transfer
      return #err("Reject message: " # Error.message(error));
    };
  };
};
