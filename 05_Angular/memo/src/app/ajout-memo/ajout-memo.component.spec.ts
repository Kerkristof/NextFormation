import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AjoutMemoComponent } from './ajout-memo.component';

describe('AjoutMemoComponent', () => {
  let component: AjoutMemoComponent;
  let fixture: ComponentFixture<AjoutMemoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AjoutMemoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AjoutMemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
