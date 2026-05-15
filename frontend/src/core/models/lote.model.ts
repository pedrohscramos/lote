export interface Documento {
    tipo: string;
    nome: string;
}

export interface Lote {
    id:number;
    operador: string;
    processo: string;
    status: 'PENDENTE' | 'EXPORTADO' | 'REJEITADO';
    dataCriacao: string;
    documentos: Documento[];
}