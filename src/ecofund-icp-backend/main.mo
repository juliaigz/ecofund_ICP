import Blob "mo:base/Blob";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
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

  type ProjectId = Text;

  let projectsList = HashMap.HashMap<ProjectId, Project>(0, Text.equal, Text.hash);

  public shared (msg) func whoami() : async Principal {
    msg.caller;
  };

  public query func showProjects() : async [(ProjectId, Project)] {
    let projectsIter = projectsList.entries();
    return Iter.toArray(projectsIter);
  };

  public query func showProjectById(idProject : ProjectId) : async ?Project {
    return projectsList.get(idProject);
  };

  public shared func addProject(idProject : ProjectId, project : Project) : async () {
    if (projectsList.get(idProject) == null) {
      projectsList.put(idProject, project);
    };
  };

  public func updateProjectById(idProject : ProjectId, project : Project) : async ?Project {
    if (projectsList.get(idProject) != null) {
      projectsList.put(idProject, project);
      return projectsList.get(idProject);
    } else {
      return null;
    };
  };

  public func removeProjectById(idProject : ProjectId) : async ?Project {
    return projectsList.remove(idProject);
  };
};
