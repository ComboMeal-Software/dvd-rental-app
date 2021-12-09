import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { DvdListComponent } from "./dvd-list.component";
import { TuiIslandModule } from "@taiga-ui/kit";
import { TuiButtonModule } from "@taiga-ui/core";

@NgModule({
    declarations: [DvdListComponent],
    imports: [CommonModule, TuiIslandModule, TuiButtonModule],
    exports: [DvdListComponent],
})
export class DvdListModule {}
