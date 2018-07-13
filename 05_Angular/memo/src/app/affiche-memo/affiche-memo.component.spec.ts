import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AfficheMemoComponent } from './affiche-memo.component';

describe('AfficheMemoComponent', () => {
  let component: AfficheMemoComponent;
  let fixture: ComponentFixture<AfficheMemoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AfficheMemoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AfficheMemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
