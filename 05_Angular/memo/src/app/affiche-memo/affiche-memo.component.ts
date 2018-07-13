import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-affiche-memo',
  templateUrl: './affiche-memo.component.html',
  styleUrls: ['./affiche-memo.component.css']
})
export class AfficheMemoComponent implements OnInit {
  memo = [
    {titre:"COURSES", core:"Faire les courses", theme:"Domestique", check:false},
    {titre:"BILAN", core:"Appeller le comptable", theme:"Professionnel", check:false},
    {titre:"AMIS", core:"Inviter les voisins", theme:"Domestique", check:false},
    {titre:"IMPOTS", core:"Faire la déclaration", theme:"Administratif", check:false}
  ];
  constructor() { }

  ngOnInit() {
  }

}
