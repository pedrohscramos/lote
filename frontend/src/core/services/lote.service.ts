import { Injectable, inject } from "@angular/core";
import { HttpClient, HttpParams } from "@angular/common/http";
import { Observable } from "rxjs";
import { Lote } from "../models/lote.model";

@Injectable({
    providedIn: 'root'
})
export class LoteService {
    private http = inject(HttpClient);
    private apiUrl = 'http://localhost:8080/api/lotes';

    listar(status?: string): Observable<any>{
        let params = new HttpParams();
        if(status && status !== 'TODOS'){
            params = params.set('status', status);
        }
        return this.http.get<any>(this.apiUrl, { params });
    }

    atualizarStatus(id: number, status: string){
        return this.http.patch(`${this.apiUrl}/${id}/status`, { status });
    }
}