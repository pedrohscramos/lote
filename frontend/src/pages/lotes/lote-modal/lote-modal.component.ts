import { Component, Inject, inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { MatButtonModule } from '@angular/material/button';
import { MatSelectModule } from '@angular/material/select';

import { LoteService } from '../../../core/services/lote.service';

@Component({
  selector: 'app-lote-modal',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatButtonModule,
    MatSelectModule
  ],
  templateUrl: './lote-modal.component.html'
})
export class LoteModalComponent {

  private service = inject(LoteService);

  status: string;

  constructor(
    @Inject(MAT_DIALOG_DATA)
    public data: any,

    private dialogRef: MatDialogRef<LoteModalComponent>
  ) {
    this.status = data.status;
  }

  salvar() {

    this.service.atualizarStatus(
      this.data.id,
      this.status
    )
    .subscribe({
      next: () => {
        this.dialogRef.close(true);
      },
      error: err => {
        alert(err.error.erro);
      }
    });
  }
}