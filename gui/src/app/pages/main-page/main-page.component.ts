import { Component } from "@angular/core";
import { SearchMode } from "./search-mode";

@Component({
    selector: "app-main-page",
    templateUrl: "./main-page.component.html",
    styleUrls: ["./main-page.component.scss"],
})
export class MainPageComponent {
    searchMode = SearchMode;
    currentSearchMode = SearchMode.DVD;
}
