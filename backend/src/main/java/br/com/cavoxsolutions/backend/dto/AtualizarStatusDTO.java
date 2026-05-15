package br.com.cavoxsolutions.backend.dto;

import br.com.cavoxsolutions.backend.enums.StatusLote;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AtualizarStatusDTO {

    @NotNull(message = "Status é obrigatório")
    private StatusLote status;
}
