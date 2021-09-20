def cutadapt_extra(wildcards):

    extra = list(config["rules"]["cutadapt"]["extra"])

    extra += ['--length {}'.format(
        config["options"]["qdnaseq"]["read_length"])]

    return " ".join(extra)


rule cutadapt:
    input:
        "fastq/raw/{unit}.R1.fastq.gz"
    output:
        fastq=temp("fastq/trimmed/{unit}.R1.fastq.gz"),
        qc="qc/cutadapt/{unit}.txt"
    params:
        extra=cutadapt_extra
    log:
        "logs/cutadapt/{unit}.log"
    wrapper:
        "0.78.0/bio/cutadapt/se"
