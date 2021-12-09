import { TuiRootModule } from "@taiga-ui/core";
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { MainPageModule } from "./pages/main-page/main-page.module";

@NgModule({
    declarations: [AppComponent],
    imports: [
        MainPageModule,
        BrowserModule,
        AppRoutingModule,
        BrowserAnimationsModule,
        TuiRootModule,
    ],
    bootstrap: [AppComponent],
})
export class AppModule {}
