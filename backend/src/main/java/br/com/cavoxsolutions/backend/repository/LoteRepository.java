package br.com.cavoxsolutions.backend.repository;

import br.com.cavoxsolutions.backend.entity.Lote;
import br.com.cavoxsolutions.backend.enums.StatusLote;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoteRepository extends JpaRepository<Lote, Long> {

    Page<Lote> findByStatusAndOperador(
            StatusLote status,
            String operador,
            Pageable pageable
    );

    Page<Lote> findByStatus(StatusLote status, Pageable pageable);

    Page<Lote> findByOperador(String operador, Pageable pageable);
}
