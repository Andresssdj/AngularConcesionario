<div class="form-group row mb-2">
                    <div class="col-sm-2">
                        <span>Recarga celular</span><br>
                        <div class="text-gray-300">
                            {{ dtoConfigParamsTef.value.tef.ISRECARGACELULAR == 1 ? 'Integrada' : 'Desintegrada' }}
                        </div>
                    </div>
                    <div class="col-sm-3 ml-1">
                        <span>Cupón</span><br>
                        <div class="text-gray-300">
                            {{ dtoConfigParamsTef.value.tef.ISCUPON == 1 ? 'Integrado' : 'Desintegrado' }}
                        </div>
                    </div> 

                </div>
