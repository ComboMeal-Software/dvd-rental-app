import { Component } from "@angular/core";
import { FormControl, FormGroup } from "@angular/forms";

@Component({
    selector: "app-dvd-creating-page",
    templateUrl: "./dvd-creating-page.component.html",
    styleUrls: ["./dvd-creating-page.component.scss"],
})
export class DvdCreatingPageComponent {
    items = [
        "Luke Skywalker",
        "Leia Organa Solo",
        "Darth Vader",
        "Han Solo",
        "Obi-Wan Kenobi",
        "Yoda",
    ];

    dvdForm = new FormGroup({});

    testValue = new FormControl(this.items[0]);
}
