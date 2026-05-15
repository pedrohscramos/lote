package br.com.cavoxsolutions.backend.entity;

import br.com.cavoxsolutions.backend.enums.StatusLote;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "lote")
public class Lote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String operador;

    private String processo;

    @Enumerated(EnumType.STRING)
    private StatusLote status;

    private LocalDateTime dataCriacao;

    @OneToMany(
            mappedBy = "lote",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.LAZY
    )
    private List<Documento> documentos;
}
