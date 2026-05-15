import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { MatTableModule } from '@angular/material/table';
import { MatSelectModule } from '@angular/material/select';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';

import { LoteService } from '../../core/services/lote.service';
import { Lote } from '../../core/models/lote.model';

import { StatusBadgeComponent } from '../../shared/components/status-badge/status-badge.component';
import { LoteModalComponent } from './lote-modal/lote-modal.component';

@Component({
  selector: 'app-lotes-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatTableModule,
    MatSelectModule,
    MatProgressSpinnerModule,
    MatDialogModule,
    StatusBadgeComponent,
    MatPaginatorModule
  ],
  templateUrl: './lotes-page.component.html',
  styleUrls: ['./lotes-page.component.scss']
})
export class LotesPageComponent implements OnInit {

  private service = inject(LoteService);

  private dialog = inject(MatDialog);

  erro = '';

  lotes: Lote[] = [];

  loading = false;

  filtroStatus = 'TODOS';

  page = 0;

  size = 10;

  totalElements = 0;

  displayedColumns = [
    'id',
    'operador',
    'processo',
    'status',
    'dataCriacao'
  ];

  ngOnInit() {
    this.buscarLotes();
  }

  buscarLotes() {

    this.loading = true;

    this.erro = '';

    this.service.listar(
        this.filtroStatus,
        this.page,
        this.size
      )
      .subscribe({
        next: response => {
          this.lotes = response.content;
          this.totalElements = response.totalElements;
          this.loading = false;
        },
        error: () => {
          this.loading = false;
          this.erro = 'Erro ao carregar lotes';
        }
      });
  }

  abrirModal(lote: Lote) {

    const dialogRef = this.dialog.open(
      LoteModalComponent,
      {
        width: '400px',
        data: lote
      }
    );

    dialogRef.afterClosed()
      .subscribe(result => {

        if (result) {
          this.buscarLotes();
        }
      });
  }

  alterarPagina(event: PageEvent) {

    this.page = event.pageIndex;

    this.size = event.pageSize;

    this.buscarLotes();
  }
}