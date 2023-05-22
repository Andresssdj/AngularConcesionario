import { Component } from '@angular/core';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {
  isDropdownOpen = false; // Variable para controlar si el dropdown está abierto o cerrado

  toggleDropdown() {
    this.isDropdownOpen = !this.isDropdownOpen; // Cambiar el estado de la variable cuando se haga clic en el botón del dropdown
  }
}