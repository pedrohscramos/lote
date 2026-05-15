package br.com.cavoxsolutions.backend.service;

import br.com.cavoxsolutions.backend.dto.AtualizarStatusDTO;
import br.com.cavoxsolutions.backend.dto.LoteListResponseDTO;
import br.com.cavoxsolutions.backend.dto.LoteRequestDTO;
import br.com.cavoxsolutions.backend.entity.Documento;
import br.com.cavoxsolutions.backend.entity.Lote;
import br.com.cavoxsolutions.backend.enums.StatusLote;
import br.com.cavoxsolutions.backend.exception.BusinessException;
import br.com.cavoxsolutions.backend.exception.NotFoundException;
import br.com.cavoxsolutions.backend.repository.LoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LoteService {

    private final LoteRepository repository;

    public Lote criar(LoteRequestDTO dto) {

       Lote lote = new Lote();

       lote.setOperador(dto.getOperador());
       lote.setProcesso(dto.getProcesso());
       lote.setStatus(StatusLote.PENDENTE);
       lote.setDataCriacao(LocalDateTime.now());

        List<Documento> documentos = dto.getDocumentos()
                .stream()
                .map(docDto -> {
                    Documento doc = new Documento();

                    doc.setTipo(docDto.getTipo());
                    doc.setNome(docDto.getNome());
                    doc.setLote(lote);

                    return doc;
                }).toList();

        lote.setDocumentos(documentos);

        return repository.save(lote);
    }

    public Page<LoteListResponseDTO> listar(
            StatusLote status,
            String operador,
            Pageable pageable
    ) {
        Page<Lote> page;

        if (status != null && operador != null) {
            page = repository.findByStatusAndOperador(status, operador, pageable);
        } else if(status != null){
            page = repository.findByStatus(status,pageable);
        } else if(operador != null){
            page = repository.findByOperador(
                    operador,
                    pageable
            );
        }else{
            page = repository.findAll(pageable);
        }


        return page.map(lote -> LoteListResponseDTO.builder()
                .id(lote.getId())
                .operador(lote.getOperador())
                .processo(lote.getProcesso())
                .status(lote.getStatus())
                .dataCriacao(lote.getDataCriacao())
                .build()
        );
    }

    public Lote atualizarStatus(Long id, AtualizarStatusDTO dto) {

        Lote lote = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Lote não encontrado"));

        if (lote.getStatus() == StatusLote.EXPORTADO) {
            throw new BusinessException("Lote EXPORTADO não pode ser alterado");
        }

        lote.setStatus(dto.getStatus());

        return repository.save(lote);
    }
}
