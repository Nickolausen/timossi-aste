class Opera : IOpera {
    public int IDOpera { get; set; }
    public string? Descrizione { get; set; }
    public int Anno { get; set; }
    public int IDMateriale { get; set; }
    public int IDCollezione { get; set; }
    public int? IDLuogo { get; set; }
    private Opera[]? ElencoOpere;
    
    public Opera()
    {
        
    }
    
    public Opera[]? GetElencoOpere() {
        return ElencoOpere;
    }
}