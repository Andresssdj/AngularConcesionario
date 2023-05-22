import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; //Hicimos esta importacion para traer los datos de springboot
import { Observable } from 'rxjs';
import { ResponseI } from '../model/ResponseI';


const urlBase="http://localhost:8088/usuario"

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http: HttpClient) { } //Este es el contructor de la imoprtacion de httpClient

  getAllUsuario():Observable<ResponseI> {
    return this.http.get<ResponseI>(urlBase+"/all"); //Este es el metodo de la llamada a la API de springboot,Nota que la URL /api/datos se debe ajustar según la ruta de la API de Spring Boot que quieras consumir.
  }
  crearUsuario(data: any):Observable<ResponseI>{
    return this.http.post<ResponseI>(urlBase+"/crear",data);
  }
  eliminar(data:number):Observable<Response>{
    console.log("###### ",data);

    return this.http.get<Response>(urlBase+"/eliminar/"+data);
  }
}

