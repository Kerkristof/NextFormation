import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule} from '@angular/router';

import { AppComponent } from './app.component';
import { AjoutMemoComponent } from './ajout-memo/ajout-memo.component';
import { AfficheMemoComponent } from './affiche-memo/affiche-memo.component';
import { AjoutThemeComponent } from './ajout-theme/ajout-theme.component';

@NgModule({
  declarations: [
    AppComponent,
    AjoutMemoComponent,
    AfficheMemoComponent,
    AjoutThemeComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot([
      {path: "afficheMemo",
      component: AfficheMemoComponent
      },
      {path: "ajoutMemo",
      component: AjoutMemoComponent
      },
      {path: "ajoutTheme",
      component: AjoutThemeComponent
      }
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
