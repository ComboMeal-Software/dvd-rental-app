import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { DvdCreatingPageComponent } from "./dvd-creating-page.component";
import {
    TuiDataListWrapperModule,
    TuiInputModule,
    TuiSelectModule,
} from "@taiga-ui/kit";
import { TuiTextfieldControllerModule } from "@taiga-ui/core";

@NgModule({
    declarations: [DvdCreatingPageComponent],
    imports: [
        CommonModule,
        TuiInputModule,
        TuiSelectModule,
        TuiDataListWrapperModule,
        TuiTextfieldControllerModule,
    ],
    exports: [DvdCreatingPageComponent],
})
export class DvdCreatingModule {}
