package br.com.cavoxsolutions.backend.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class DocumentoRequestDTO {

    @NotBlank(message = "Tipo de documento é obrigatório")
    private String tipo;

    @NotBlank(message = "Nome do documento é obrigatório")
    private String nome;
}
