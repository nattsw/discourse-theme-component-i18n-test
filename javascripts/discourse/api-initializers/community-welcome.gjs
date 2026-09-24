import { apiInitializer } from "discourse/lib/api";
import CommunityWelcome from "../components/community-welcome";

export default apiInitializer((api) => {
  api.renderInOutlet("discovery-list-container-top", CommunityWelcome);
});
