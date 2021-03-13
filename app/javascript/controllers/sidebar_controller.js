import ApplicationController from "./application_controller";

export default class extends ApplicationController {
  static targets = ["sidebar", "overlay"];

  toggle() {
    if (this.isClosed) {
      this.open();
    } else {
      this.hide();
    }
  }

  open() {
    this.sidebarTarget.classList.replace("-translate-x-full", "translate-x-0");
    this.overlayTarget.removeAttribute("hidden");
  }

  hide() {
    this.sidebarTarget.classList.replace("translate-x-0", "-translate-x-full");
    this.overlayTarget.setAttribute("hidden", "");
  }

  get isClosed() {
    return this.sidebarTarget.classList.contains("-translate-x-full");
  }
}
