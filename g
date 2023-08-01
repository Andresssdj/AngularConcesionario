<div class="col-sm-4">
                    <strong>Bono virtual :</strong><br>
                    <span class="text-gray-300">
                        {{ tefDTO.ISBONOVIRTUAL == 1 ? 'Integrado' : 'Desintegrado' }}
                    </span>
                </div>

refactoriaza
<div class="form-group">
    <label>Avance</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="avanceOption" [(ngModel)]="dtoConfigParamsTef.value.tef.ISAVANCE" [value]="1">
        <label class="form-check-label">Integrado</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="avanceOption" [(ngModel)]="dtoConfigParamsTef.value.tef.ISAVANCE" [value]="0">
        <label class="form-check-label">Desintegrado</label>
    </div>
</div>


solution


<div class="col-sm-3 ml-1">
    <span>Avance</span><br>
    <div class="text-gray-300">
        <input type="radio" [(ngModel)]="dtoConfigParamsTef.value.tef.ISAVANCE" [value]="1"> Integrado
        <input type="radio" [(ngModel)]="dtoConfigParamsTef.value.tef.ISAVANCE" [value]="0"> Desintegrado
    </div>
</div>
