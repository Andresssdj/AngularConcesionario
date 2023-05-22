import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ResponseI } from '../model/ResponseI';


const urlBase= "http://localhost:8088/vehiculo"

@Injectable({
  providedIn: 'root'
})
export class VehiculoServiceService {

  constructor(private http: HttpClient) { }

  getAllVehiculo():Observable<ResponseI>{
    return this.http.get<ResponseI>(urlBase+"/all");
  }
  crearVehiculo(data: any):Observable<ResponseI>{
  return this.http.post<ResponseI>(urlBase+"/crear",data);
}
eliminar(data:number):Observable<Response>{
  console.log("###### ",data);

  return this.http.get<Response>(urlBase+"/eliminar/"+data);
}
}
