<mat-form-field class="col-sm-3">
                            <mat-label>Bono virtual</mat-label>
                            <mat-select matNativeControl [(ngModel)]="tefDTO.ISBONOVIRTUAL" name="ISBONOVIRTUAL" matTooltip="Integrar transacción bono virtual"
                                minlength="1" required>
                                <mat-option value="0">Desintegrado</mat-option>
                                <mat-option value="1">Integrado</mat-option>
                            </mat-select>
                        </mat-form-field>

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



<mat-form-field class="col-sm-3">
    <mat-label>Bono virtual</mat-label>
    <mat-select [(ngModel)]="tefDTO.ISBONOVIRTUAL" name="ISBONOVIRTUAL" matTooltip="Integrar transacción bono virtual" required>
        <mat-option value="0">Desintegrado</mat-option>
        <mat-option value="1">Integrado</mat-option>
    </mat-select>
</mat-form-field>
