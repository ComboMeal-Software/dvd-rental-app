import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { DvdListComponent } from "./dvd-list.component";
import { TuiIslandModule } from "@taiga-ui/kit";
import { TuiButtonModule, TuiScrollbarModule } from "@taiga-ui/core";
import { DvdItemComponent } from "./dvd-item/dvd-item.component";

@NgModule({
    declarations: [DvdListComponent, DvdItemComponent],
    imports: [
        CommonModule,
        TuiIslandModule,
        TuiButtonModule,
        TuiScrollbarModule,
    ],
    exports: [DvdListComponent],
})
export class DvdListModule {}
