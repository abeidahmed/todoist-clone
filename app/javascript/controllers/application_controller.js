import { Controller } from "stimulus";

export default class ApplicationController extends Controller {
  get pageIsTurboPreview() {
    return document.documentElement.hasAttribute("data-turbo-preview");
  }
}
