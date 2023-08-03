<mat-form-field class="col-sm-3">
                            <mat-label>Pago móvil</mat-label>
                            <mat-select matNativeControl [(ngModel)]="tefDTO.ISPAGOMOVIL" name="ISPAGOMOVIL" matTooltip="Integrar transacción pago móvil"
                                minlength="1" required>
                                <mat-option value="0">Desintegrado</mat-option>
                                <mat-option value="1">Integrado</mat-option>
                            </mat-select>
                        </mat-form-field>

                        <mat-form-field class="col-sm-3">
                            <mat-label>Bono virtual</mat-label>
                            <mat-select matNativeControl [(ngModel)]="tefDTO.ISBONOVIRTUAL" name="ISBONOVIRTUAL" matTooltip="Integrar transacción bono virtual"
                                minlength="1" required>
                                <mat-option value="0">Desintegrado</mat-option>
                                <mat-option value="1">Integrado</mat-option>
                            </mat-select>
                        </mat-form-field>

                        <mat-form-field class="col-sm-3">
                            <mat-label>Recarga celular</mat-label>
                            <mat-select matNativeControl [(ngModel)]="tefDTO.ISRECARGACELULAR" name="ISRECARGACELULAR" matTooltip="Integrar transacción recarga celular"
                                minlength="1" required>
                                <mat-option value="0">Desintegrada</mat-option>
                                <mat-option value="1">Integrada</mat-option>
                            </mat-select>
                        </mat-form-field>

                        <mat-form-field class="col-sm-3">
                            <mat-label>Cupón</mat-label>
                            <mat-select matNativeControl [(ngModel)]="tefDTO.ISCUPON" name="ISCUPON" matTooltip="Integrar transacción cupón"
                                minlength="1" required>
                                <mat-option value="0">Desintegrado</mat-option>
                                <mat-option value="1">Integrado</mat-option>
                            </mat-select>
                        </mat-form-field>

