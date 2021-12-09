import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { SearchComponent } from "./search/search.component";
import {
    TuiButtonModule,
    TuiGroupModule,
    TuiHintControllerModule,
} from "@taiga-ui/core";
import { TuiInputModule, TuiRadioBlockModule } from "@taiga-ui/kit";
import { ReactiveFormsModule } from "@angular/forms";
import { MainPageComponent } from "./main-page.component";
import { DvdListModule } from "./dvd-list/dvd-list.module";
import { ClientListModule } from "./client-list/client-list.module";

@NgModule({
    declarations: [SearchComponent, MainPageComponent],
    imports: [
        CommonModule,
        ReactiveFormsModule,
        TuiGroupModule,
        TuiHintControllerModule,
        TuiRadioBlockModule,
        TuiInputModule,
        TuiButtonModule,
        DvdListModule,
        ClientListModule,
    ],
    exports: [MainPageComponent],
})
export class MainPageModule {}