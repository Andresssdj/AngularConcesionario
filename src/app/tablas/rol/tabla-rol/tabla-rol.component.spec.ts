import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TablaRolComponent } from './tabla-rol.component';

describe('TablaRolComponent', () => {
  let component: TablaRolComponent;
  let fixture: ComponentFixture<TablaRolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TablaRolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TablaRolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
