import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { SearchComponent } from "./search/search.component";
import { TuiGroupModule, TuiHintControllerModule } from "@taiga-ui/core";
import { TuiInputModule, TuiRadioBlockModule } from "@taiga-ui/kit";
import { ReactiveFormsModule } from "@angular/forms";

@NgModule({
    declarations: [SearchComponent],
    imports: [
        CommonModule,
        ReactiveFormsModule,
        TuiGroupModule,
        TuiHintControllerModule,
        TuiRadioBlockModule,
        TuiInputModule,
    ],
    exports: [SearchComponent],
})
export class SearchModule {}
