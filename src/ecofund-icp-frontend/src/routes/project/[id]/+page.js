import { backend } from "$lib/canisters";
import { error } from "@sveltejs/kit";

export const prerender = false;

export async function load({ params }) {
  const { id } = params;

  try {
    const project = await backend.showProjectById(id);
    console.log("Backend response:", project);

    if (!project || Object.keys(project).length === 0) {
      throw error(404, "Project not found");
    }

    return project; // Se envía el proyecto al frontend
  } catch (err) {
    console.error("Error loading project:", err);
    throw error(404, "Project not found");
  }
}
