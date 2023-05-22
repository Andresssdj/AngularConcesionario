import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TablaConcesionarioComponent } from './tabla-concesionario.component';

describe('TablaConcesionarioComponent', () => {
  let component: TablaConcesionarioComponent;
  let fixture: ComponentFixture<TablaConcesionarioComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TablaConcesionarioComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TablaConcesionarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
