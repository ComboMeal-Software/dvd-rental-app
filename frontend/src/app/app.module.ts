import { TuiButtonModule, TuiGroupModule, TuiRootModule } from "@taiga-ui/core";
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { MainPageModule } from "./pages/main-page/main-page.module";
import { ClientCreatingModule } from "./pages/client-creating-page/client-creating.module";
import { DvdCreatingModule } from "./pages/dvd-creating-page/dvd-creating.module";

@NgModule({
    declarations: [AppComponent],
    imports: [
        MainPageModule,
        ClientCreatingModule,
        DvdCreatingModule,
        BrowserModule,
        AppRoutingModule,
        BrowserAnimationsModule,
        TuiRootModule,
        TuiGroupModule,
        TuiButtonModule,
    ],
    bootstrap: [AppComponent],
})
export class AppModule {}
