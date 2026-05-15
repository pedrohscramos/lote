package br.com.cavoxsolutions.backend.dto;

import br.com.cavoxsolutions.backend.enums.StatusLote;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoteListResponseDTO {

    private Long id;

    private String operador;

    private String processo;

    private StatusLote status;

    private LocalDateTime dataCriacao;
}
