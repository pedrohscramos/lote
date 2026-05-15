package br.com.cavoxsolutions.backend.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
public class LoteRequestDTO {

    @NotBlank(message = "Operador é obrigatório")
    private String operador;

    @NotBlank(message = "Processo é obrigatório")
    private String processo;

    @Valid
    @NotEmpty(message = "O lote deve possuir ao menos 1 documento")
    private List<DocumentoRequestDTO> documentos;
}
