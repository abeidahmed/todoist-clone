import ApplicationController from "./application_controller";
import { useClickOutside } from "stimulus-use";

export default class extends ApplicationController {
  static targets = ["toggleable"];
  static values = {
    attribute: String,
  };

  connect() {
    useClickOutside(this);

    if (this.pageIsTurboPreview) {
      this.hide();
    }
  }

  toggle() {
    this.toggleableTargets.forEach((target) => {
      if (target.hasAttribute(this.attributeValue)) {
        target.removeAttribute(this.attributeValue);
      } else {
        target.setAttribute(this.attributeValue, "");
      }
    });
  }

  hide() {
    this.toggleableTarget.setAttribute(this.attributeValue, "");
  }
}
