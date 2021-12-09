import { Component } from "@angular/core";
import { FormControl, FormGroup } from "@angular/forms";
import { SearchMode } from "../search-mode";

enum SearchFormField {
    TEXT,
    MODE,
}

@Component({
    selector: "app-search",
    templateUrl: "./search.component.html",
    styleUrls: ["./search.component.scss"],
})
export class SearchComponent {
    searchFormField = SearchFormField;
    searchMode = SearchMode;

    searchForm = new FormGroup({
        [SearchFormField.TEXT]: new FormControl(),
        [SearchFormField.MODE]: new FormControl(SearchMode.DVD),
    });
}
