unit GBFR.NFe.Avulsa.Constants;

interface

{$REGION 'XMLBASE'}
const
  CXMLBase =
    '''
      <?xml version="1.0" encoding="UTF-8"?>
      <nfeProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/nfe">
        <protNFe>
          <infProt>
            <nProt>242260366429847</nProt>
            <digVal>VCGfDM1lGSsctC3+mMJEBbs9SwM=</digVal>
            <dhRecbto>2026-08-07T08:13:49-03:00</dhRecbto>
            <chNFe>42260882951310000156558900121396171039686994</chNFe>
            <xMotivo>Autorizado o uso da NF-e</xMotivo>
            <cStat>100</cStat>
          </infProt>
        </protNFe>
        <NFe>
          <infNFe Id="NFe42260882951310000156558900121396171039686994" versao="4.00">
            <avulsa>
              <matr>99999999</matr>
              <UF>SC</UF>
              <xAgente>NFA-e WEB</xAgente>
              <CNPJ>82951310000156</CNPJ>
              <xOrgao>SEFAZ-SC</xOrgao>
              <repEmi>SEFAZ-SC</repEmi>
            </avulsa>
            <det>
              <nItem>1</nItem>
              <prod>
                <cEAN>SEM GTIN</cEAN>
                <cProd>105311</cProd>
                <qCom>9.0000</qCom>
                <cEANTrib>SEM GTIN</cEANTrib>
                <vUnTrib>5.9000</vUnTrib>
                <qTrib>9.0000</qTrib>
                <vProd>53.10</vProd>
                <xProd>TAXA</xProd>
                <vUnCom>5.9000</vUnCom>
                <indTot>1</indTot>
                <uTrib>UN</uTrib>
                <NCM>21069090</NCM>
                <uCom>UN</uCom>
                <CFOP>5102</CFOP>
              </prod>
              <imposto>
                <ICMS>
                  <ICMSSN102>
                    <orig>0</orig>
                    <CSOSN>102</CSOSN>
                  </ICMSSN102>
                </ICMS>
                <IPI>
                  <IPINT>
                    <CST>53</CST>
                  </IPINT>
                  <cEnq>999</cEnq>
                </IPI>
                <COFINS>
                  <COFINSNT>
                    <CST>08</CST>
                  </COFINSNT>
                </COFINS>
                <PIS>
                  <PISNT>
                    <CST>08</CST>
                  </PISNT>
                </PIS>
              </imposto>
            </det>
            <total>
              <ICMSTot>
                <vCOFINS>0.00</vCOFINS>
                <vBCST>0.00</vBCST>
                <vICMSDeson>0.00</vICMSDeson>
                <vProd>53.10</vProd>
                <vSeg>0.00</vSeg>
                <vFCP>0.00</vFCP>
                <vFCPST>0.00</vFCPST>
                <vNF>53.10</vNF>
                <vTotTrib>0.00</vTotTrib>
                <vPIS>0.00</vPIS>
                <vIPIDevol>0.00</vIPIDevol>
                <vBC>0.00</vBC>
                <vST>0.00</vST>
                <vICMS>0.00</vICMS>
                <vII>0.00</vII>
                <vFCPSTRet>0.00</vFCPSTRet>
                <vDesc>0.00</vDesc>
                <vOutro>0.00</vOutro>
                <vIPI>0.00</vIPI>
                <vFrete>0.00</vFrete>
              </ICMSTot>
            </total>
            <pag>
              <detPag>
                <vPag>53.10</vPag>
                <tPag>01</tPag>
                <indPag>0</indPag>
              </detPag>
            </pag>
            <Id>NFe42260882951310000156558900121396171039686994</Id>
            <ide>
              <tpNF>1</tpNF>
              <mod>55</mod>
              <indPres>0</indPres>
              <tpImp>1</tpImp>
              <nNF>12139617</nNF>
              <cMunFG>4205407</cMunFG>
              <procEmi>1</procEmi>
              <finNFe>1</finNFe>
              <dhEmi>2026-08-07T08:09:00-03:00</dhEmi>
              <tpAmb>1</tpAmb>
              <indFinal>1</indFinal>
              <idDest>1</idDest>
              <tpEmis>1</tpEmis>
              <cDV>4</cDV>
              <cUF>42</cUF>
              <serie>890</serie>
              <natOp>Venda de Mercadoria</natOp>
              <cNF>03968699</cNF>
              <verProc>SVRS20260612220011</verProc>
              <indIntermed>0</indIntermed>
            </ide>
            <emit>
              <xNome>VENDO VERDE COMERCIO DE ORGANICOS LTDA</xNome>
              <CRT>1</CRT>
              <xFant>VENDO VERDE ORGANICOS</xFant>
              <CNPJ>21619082000127</CNPJ>
              <enderEmit>
                <xCpl>LOJA ORGANICOS DIRETO DO</xCpl>
                <fone>0489968144</fone>
                <UF>SC</UF>
                <cPais>1058</cPais>
                <xLgr>SC 401</xLgr>
                <xMun>FLORIANOPOLIS</xMun>
                <nro>3522</nro>
                <cMun>4205407</cMun>
                <xBairro>SACO GRANDE II</xBairro>
                <CEP>88032000</CEP>
              </enderEmit>
              <IE>258642017</IE>
            </emit>
            <dest>
              <xNome>COSTAO DO SANTINHO TURISMO E LAZER S.</xNome>
              <CNPJ>04908757000139</CNPJ>
              <enderDest>
                <UF>SC</UF>
                <xPais>BRASIL</xPais>
                <cPais>1058</cPais>
                <xLgr>ESTRADA VEREADOR ONILDO LEMOS</xLgr>
                <xMun>FLORIANOPOLIS</xMun>
                <nro>2505</nro>
                <cMun>4205407</cMun>
                <xBairro>INGLESES DO RIO VERMELHO</xBairro>
                <CEP>88058700</CEP>
              </enderDest>
              <IE>254894135</IE>
              <indIEDest>1</indIEDest>
            </dest>
            <transp>
              <modFrete>9</modFrete>
            </transp>
          </infNFe>
        </NFe>
        <versao>4.00</versao>
      </nfeProc>
    ''';
{$ENDREGION}

implementation

end.
