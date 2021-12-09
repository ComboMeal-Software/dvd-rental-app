import { Component } from "@angular/core";
import { FormControl, FormGroup } from "@angular/forms";

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

    searchForm = new FormGroup({
        [SearchFormField.TEXT]: new FormControl(),
        [SearchFormField.MODE]: new FormControl(),
    });
}
