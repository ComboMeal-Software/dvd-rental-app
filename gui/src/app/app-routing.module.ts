import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { ClientCreatingPageComponent } from "./pages/client-creating-page/client-creating-page.component";
import { DvdCreatingPageComponent } from "./pages/dvd-creating-page/dvd-creating-page.component";
import { MainPageComponent } from "./pages/main-page/main-page.component";

const routes: Routes = [
    { path: "add-client", component: ClientCreatingPageComponent },
    { path: "add-dvd", component: DvdCreatingPageComponent },
    { path: "main", component: MainPageComponent },
    { path: "**", redirectTo: "main" },
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule],
})
export class AppRoutingModule {}
