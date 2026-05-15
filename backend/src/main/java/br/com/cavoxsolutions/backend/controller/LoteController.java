package br.com.cavoxsolutions.backend.controller;

import br.com.cavoxsolutions.backend.dto.AtualizarStatusDTO;
import br.com.cavoxsolutions.backend.dto.LoteRequestDTO;
import br.com.cavoxsolutions.backend.entity.Lote;
import br.com.cavoxsolutions.backend.enums.StatusLote;
import br.com.cavoxsolutions.backend.service.LoteService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/lotes")
@RequiredArgsConstructor
public class LoteController {

    private final LoteService service;

    @PostMapping
    public Lote criar(@RequestBody @Valid LoteRequestDTO dto) {

        return service.criar(dto);
    }

    @GetMapping
    public Page<Lote> listar(
            @RequestParam(required = false) StatusLote status,
            @RequestParam(required = false) String operador,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {

        Pageable pageable = PageRequest.of(page, size);

        return service.listar(status, operador, pageable);
    }

    @PatchMapping("/{id}/status")
    public Lote atualizarStatus(
            @PathVariable Long id,
            @RequestBody @Valid AtualizarStatusDTO dto
    ) {

        return service.atualizarStatus(id, dto);
    }
}
