import { apiInitializer } from "discourse/lib/api";
import ObjectResources from "../components/object-resources";

export default apiInitializer((api) => {
  api.renderInOutlet("discovery-list-container-top", ObjectResources);
});
