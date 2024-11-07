import Blob "mo:base/Blob";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Bool "mo:base/Bool";
import Map "mo:map/Map";
import { thash } "mo:map/Map";
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

  // stable let projectsList = HashMap.HashMap<ProjectId, Project>(0, Text.equal, Text.hash);
  let projectsList = Map.new<ProjectId, Project>();

  public shared (msg) func whoami() : async Principal {
    msg.caller;
  };

  // public query func maptest() : async () {
  //   // return Map.get<Text, Project>(projectsList, thash, id);
  //   Debug.print(
  //     debug_show (
  //       Map.entries<ProjectId, Project>(projectsList).current()
  //     )
  //   );
  // };

  // public query func maptest2(idProject : ProjectId, project : Project) : async ?Project {
  //   return Map.put<ProjectId, Project>(projectsList, thash, idProject, project);
  //   // Debug.print(debug_show (projects));
  // };

  public query func showProjects() : async ?(ProjectId, Project) {
    // Debug.print(
    //   debug_show (

    //     Map.entries<ProjectId, Project>(projectsList).current()

    //   )
    // );
    return Map.entries<ProjectId, Project>(projectsList).current();
  };

  public query func showProjectById(idProject : ProjectId) : async ?Project {
    // return projectsList.get(idProject);
    // Debug.print(debug_show ("showProjectById"));
    // Debug.print(debug_show (idProject));
    // Debug.print(debug_show (Map.get(projectsList, thash, idProject)));
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
    if (existingProject == null) {
      return Map.put<ProjectId, Project>(projectsList, thash, idProject, project);
    };
    return Map.get<ProjectId, Project>(projectsList, thash, idProject);
  };

  public func removeProjectById(idProject : ProjectId) : async ?Project {
    return Map.remove<ProjectId, Project>(projectsList, thash, idProject);
  };
};
