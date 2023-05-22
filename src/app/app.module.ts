import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TablaUsuarioComponent } from './tablas/usuario/tabla-usuario/tabla-usuario.component';
import { TablaVehiculoComponent } from './tablas/vehiculo/tabla-vehiculo/tabla-vehiculo.component';
import { TablaConcesionarioComponent } from './tablas/concesionario/tabla-concesionario/tabla-concesionario.component';
import { TablaMarcaComponent } from './tablas/marca/tabla-marca/tabla-marca.component';
import { TablaRolComponent } from './tablas/rol/tabla-rol/tabla-rol.component';
import { TablaVentaComponent } from './tablas/venta/tabla-venta/tabla-venta.component';
import { FooterComponent } from './templates/footer/footer.component';
import { HeaderComponent } from './templates/header/header.component';
import { MenuComponent } from './templates/menu/menu.component';
import { UsuarioService } from './servicio/service.service';
import { HttpClientModule } from '@angular/common/http';
import { AddUsuarioComponent } from './tablas/usuario/add-usuario/add-usuario.component';
import { AddConcesionarioComponent } from './tablas/concesionario/add-concesionario/add-concesionario.component';
import { AddVehiculoComponent } from './tablas/vehiculo/add-vehiculo/add-vehiculo.component';
import { AddMarcaComponent } from './tablas/marca/add-marca/add-marca.component';
import { AddVentaComponent } from './tablas/venta/add-venta/add-venta.component';
import { AddRolComponent } from './tablas/rol/add-rol/add-rol.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { VehiculoServiceService } from './servicio/vehiculo-service.service';
import { VentaServiceService } from './servicio/venta-service.service';
import { MarcaServiceService } from './servicio/marca-service.service';
import { RolServiceService } from './servicio/rol-service.service';
import { ConcesionarioServiceService } from './servicio/concesionario-service.service';

@NgModule({
  declarations: [
    AppComponent,
    TablaUsuarioComponent,
    TablaVehiculoComponent,
    TablaConcesionarioComponent,
    TablaMarcaComponent,
    TablaRolComponent,
    TablaVentaComponent,
    FooterComponent,
    HeaderComponent,
    MenuComponent,
    AddUsuarioComponent,
    AddConcesionarioComponent,
    AddVehiculoComponent,
    AddMarcaComponent,
    AddVentaComponent,
    AddRolComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule

  ],
  providers: [UsuarioService,VehiculoServiceService, VentaServiceService, MarcaServiceService, RolServiceService, ConcesionarioServiceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
