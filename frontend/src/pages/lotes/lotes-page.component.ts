import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { MatTableModule } from '@angular/material/table';
import { MatSelectModule } from '@angular/material/select';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';

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
    StatusBadgeComponent
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

  displayedColumns = [
    'id',
    'operador',
    'processo',
    'status',
    'dataCriacao'
  ];

  ngOnInit(): void {
    this.buscarLotes();
  }

  buscarLotes() {

    this.loading = true;

    this.service.listar(this.filtroStatus)
      .subscribe({
        next: response => {
          this.lotes = response.content;
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
}