import Blob "mo:base/Blob";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  // type Wallet = {
  //   principalId : Text;
  //   accountId : Text;
  // };
  // let wallets = HashMap.HashMap<Text, Wallet>(0, Text.equal, Text.hash);
  // wallets.put("1", { principalId = "5y3sh-tmxh2-3mw37-2u5cc-jztqx-6zlty-qvzxy-zdsvp-rjjmz-5thhd-3ae"; accountId = "null" });

  // public func getWallet() : async [(Text, Wallet)] {
  //   let walletIter : Iter.Iter<(Text, Wallet)> = wallets.entries();
  //   let walletArray : [(Text, Wallet)] = Iter.toArray(walletIter);

  //   return walletArray;
  // };

  // Define the Project type
  type Project = {
    project_principal : Text;
    project_name : Text;
    categories : [Text];
    project_description : Text;
    project_images : [Blob];
    target_amount : Nat;
    target_percentage : Nat;
    donated_amount : Nat;
  };

  // Define a separate type for the project ID
  type ProjectId = Text;

  let projectsList = HashMap.HashMap<ProjectId, Project>(0, Text.equal, Text.hash);

  public shared (msg) func whoami() : async Principal {
    msg.caller;
  };

  // ====-====-====-====-==== CRUD projects ====-====-====-====-==== \\

  // Read
  public query func showProjects() : async [(ProjectId, Project)] {
    let projectsIter : Iter.Iter<(ProjectId, Project)> = projectsList.entries();
    let projectsArray : [(ProjectId, Project)] = Iter.toArray(projectsIter);

    return projectsArray;
  };

  public query func showProjectById(idProject : ProjectId) : async ?Project {
    let project : ?Project = projectsList.get(idProject);

    return project;
  };

  // Create
  public shared func addProject(idProject : ProjectId, project : Project) : async () {
    let existingProject : ?Project = projectsList.get(idProject);
    if (existingProject != null) {
      // Debug.print("Project with id:" # Nat.toText(idProject) # " already exists");
      return ();
    } else {
      projectsList.put(idProject, project);
      // Debug.print("Created project with id:" # Nat.toText(idProject));
      return ();
    };
  };

  // Update
  public func updateProjectById(idProject : ProjectId, project : Project) : async ?Project {
    let existingProject : ?Project = projectsList.get(idProject);
    if (existingProject != null) {
      projectsList.put(idProject, project);
      return existingProject;
    } else {
      return null;
    };
  };

  // Delete
  public func removeProjectById(idProject : ProjectId) : async ?Project {
    let project : ?Project = projectsList.remove(idProject);

    return project;
  };

};
