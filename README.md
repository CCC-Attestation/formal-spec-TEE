# Formal Specification and Verification of Architecturally-defined Attestation Mechanisms in Confidential Computing

This repo contains the artifacts for formal specification and verification of _architecturally-defined_ remote attestation in the following groups: 

1. _Vendor solutions_: 
	- Intel TDX 

2. _Architecture led solutions_: 
	- Arm CCA

The groups are based on the level of customization possible. 

## Motivation 
Attestation is one of the most critical mechanisms of Confidential Computing. Unfortunately, the attestation mechanisms provided by TEEs are quite complex and thus these are not well-understood even by those who call themselves "experts". This lack of understanding has led to several exploits (such as [SGAxe](http://www.sgaxe.com)) and bugs (such as [those found by Google](https://www.wired.com/story/intel-google-cloud-chip-security/)).

The project aims at a better understanding of these mechanisms and the underlying trust assumptions via formal specification and verification. These mechanisms can then be composed with transport protocols (e.g., TLS and SPDM) to build attestation _frameworks_. 

## Main Challenge
The main challenge is the extraction of the attestation protocol to be formalized, as all the vendors (including Intel, Arm[^1], AMD and IBM) describe the attestation protocols informally. 
- Challenge 1: Incomplete specs (e.g., see [here](https://community.intel.com/t5/Intel-Software-Guard-Extensions/Missing-specification-documents-for-TDX/m-p/1527218))
- Challenge 2: Vague and outdated specs (e.g., see [here](https://community.intel.com/t5/Intel-Software-Guard-Extensions/index-1-in-tdxtcbcomponents/m-p/1520194))


## Approach 
Our formal models are based on: 
- in-depth reading of Intel and Arm specification documents, mainly:
	- Arm CCA
 		- RME System Architecture (Document number ARM DEN 0129, version A.d, release date 12 October 2022)
   		- RMM Spec (Document number ARM DEN 0137, version 1.0-eac2, release date 7 June 2023)
   - Intel TDX
   		- [Intel TDX white paper](https://web.archive.org/web/20230115222916/https://cdrdv2-public.intel.com/690419/TDX-Whitepaper-30Aug2021.pdf)
		- Architecture Specification: Intel Trust Domain Extensions Module (Order Number: 344425-004US, pp. 1–316, June 2022)
		- Intel SGX PCK Certificate and Certificate Revocation List Profile Specification (Revision 1.5, 6 January 2022)	 
- our experience with Intel SGX (on which the attestation architecture of Intel TDX is largely based)
- extensive discussions with Intel and Arm 

## Tool 
We use state-of-the-art symbolic security analysis tool [ProVerif](https://ieeexplore.ieee.org/document/9833653) for the specification of the protocols. 

## Scientific Publication
[The work is published](https://ieeexplore.ieee.org/document/10373038) at open-access journal IEEE Access and should be cited as follows: 

> M. U. Sardar, T. Fossati, S. Frost, S. Xiong, Formal Specification and Verification of Architecturally-defined Attestation Mechanisms in Arm CCA and Intel TDX, IEEE Access, 2024.

BibTeX:
```
@ARTICLE{Sardar2024CcaTdx,
  author={Sardar, Muhammad Usama and Fossati, Thomas and Frost, Simon and Xiong, Shale},
  journal={IEEE Access}, 
  title = {{Formal Specification and Verification of Architecturally-defined Attestation Mechanisms in Arm CCA and Intel TDX}},
  year={2024},
  volume={12},
  number={},
  pages={361-381},
  doi={10.1109/ACCESS.2023.3346501}
}
```

## Technical Specifications
Authors: Muhammad Usama Sardar, Thomas Fossati, Simon Frost and Shale Xiong
- [Draft](https://www.researchgate.net/publication/367284929_SoK_Attestation_in_Confidential_Computing) focusing on TEE-agnostic architecture
- [Paper](https://www.researchgate.net/publication/375592777_Formal_Specification_and_Verification_of_Architecturally-defined_Attestation_Mechanisms_in_Arm_CCA_and_Intel_TDX) focusing on formal specification and verification

## Important results
- We formally prove the insecurity of the TCB claimed by Intel for TDX (see [here](https://web.archive.org/web/20230115222916/https://cdrdv2-public.intel.com/690419/TDX-Whitepaper-30Aug2021.pdf)). This was reported to Intel and fixed in the latest specs. 
- We formally prove that architecturally-defined attestation does not provide authentication property.
- Ambiguities found during the process of formalization in Arm's and Intel's specification of CCA and TDX attestation are summarized in Sections III.H and IV.H (plus Appendix A), respectively, in the [paper](https://ieeexplore.ieee.org/document/10373038). These have been reported to the respective vendors. 
- The lead author (Muhammad Usama Sardar) noticed the lack of transparency in Intel's documentation process for TDX where Intel updates all the TDX white papers and specifications on the same URLs (with the older version of specs just disappearing), e.g., [Intel TDX white paper](https://web.archive.org/web/20230000000000*/https://cdrdv2.intel.com/v1/dl/getContent/690419) and [TDX Module base specs](https://web.archive.org/web/20230515000000*/https://www.intel.com/content/dam/develop/external/us/en/documents/intel-tdx-module-1.5-base-spec-348549001.pdf). He reported this to Intel privately and later [publicly](https://lists.confidentialcomputing.io/g/attestation/topic/full_transparency_of_intel/99387880) in June 2023. 

<!---
# ![alt text](https://github.com/CCC-Attestation/formal-spec-TEE/blob/main/TDX/Screenshot%20from%202024-02-06%2015-50-19.png?raw=true)

# 
# ![alt text](https://github.com/CCC-Attestation/formal-spec-TEE/blob/main/TDX/Screenshot%20from%202024-02-06%2015-51-14.png?raw=true)
--->

## Use cases 
- See [another interesting project](https://github.com/CCC-Attestation/attested-tls-poc) where our artifacts for Arm CCA are being used as a foundation for the formal verification of a specific proposal of composition of remote attestation and transport protocols (see corresponding [IETF draft](https://datatracker.ietf.org/doc/draft-fossati-tls-attestation/)).
- Intel is using our artifacts for Intel TDX for the formal verification of vTPM TD solution for Intel TDX. 

## Limitations
The symbolic security analysis has the following inherent limitations:
1. Cryptographic primitives (hash, encryption, MAC, digital signatures) are assumed to be perfect. 
2. Side-channels are out of scope. 

Complementary approaches and tools (e.g., [CryptoVerif](https://bblanche.gitlabpages.inria.fr/CryptoVerif/)) can be used to tackle these limitations. 

## Acknowledgments
We would like to thank the following for insightful discussions and helpful feedback.
- Nikolaus Thümmel (Scontain)
- Ante Derek (Univeristy of Zagreb)
- Jiewen Yao (Intel)

## Running automatic proofs 
### Installing ProVerif
Install the latest version (2.05 at the moment) of ProVerif: see https://bblanche.gitlabpages.inria.fr/proverif/ for details.
See Section 1.4 of [manual](https://bblanche.gitlabpages.inria.fr/proverif/manual.pdf) for installation options:
- via OPAM: Section 1.4.1
- from sources: Section 1.4.2 or simply try the provided [script](https://github.com/CCC-Attestation/formal-spec-TEE/blob/main/installProVerif.sh)
- from binaries: Section 1.4.3 

### Formal Analysis of Attestation
1. Run as follows: 

`proverif <filename>.pv`

For TDX: `proverif TDX/TDX.pv`

For CCA: `proverif CCA/ArmCCA_RA.pv`

2. **Generation of traces for failing properties**: In order to additionally generate a trace for each property which results in "false", create a subfolder for results before executing.

Then to execute: run as follows:
`proverif -graph <subfolderNameForResults> <filename>.pv`

Subfolder will contain the traces in .dot as well as .PDF.

3. **Horn clauses**: To additionally see the Horn clauses generated in ProVerif: 

3a. use command-line option `-test` as follows: 
`proverif <filename>.pv -test`

OR 

3b. add one of the following two settings inside the input (*.pv) file:

- `set verboseClauses = short.` to display the Horn clauses

- `set verboseClauses = explained.` to additionally display a sentence after each clause it generates to explain where this clause comes from.

4. **Interactive mode**: To run in interactive mode:
`proverif_interact <filename>.pv`


## ProVerif Tutorial
[Vincent Cheval](https://www.cs.ox.ac.uk/people/vincent.cheval/) recently gave a nice tutorial on ProVerif at [EuroProofNet event](https://europroofnet.github.io/wg3-dresden24/). 

- [Video](https://youtu.be/22PSUgnKDr0)
- [Slides](https://europroofnet.github.io/_pages/WG3/Dresden24/Slides/27-02-Vincent-Cheval.pdf)
- Exercises
	- [Needham Schroeder protocol](./ProVerifTutorial/NeedhamSchroeder_exercise.pv)
 	- [Helios voting protocol](./ProVerifTutorial/NeedhamSchroeder_exercise.pv)
  	- [Private Authentication](./ProVerifTutorial/private_authentication_exercise.pv)
  	- [Yubikey protocol](./ProVerifTutorial/yubikey_exercise.pv)	 

## Talks and Research Visits
Here is a list of talks and research visits (in reverse chronological order) on the project. 

| Event/Host | Venue | Date(s) | Funding | Material |
| --- | --- | --- | --- | --- |
| [NSA Symposium on Hot Topics in the Science of Security (HotSoS) 2024](https://cps-vo.org/group/hotsos) | Virtual | 3 April, 2024 | - | [slides](https://sos-vo.org/sites/sos-vo.org/files/2024-04/Usama_HotSoS2024_Presentation.pdf) [video](https://youtu.be/19qREfmk29c) |
| [Program Analysis and Verification on Trusted Platforms (PAVeTrust) 2023](https://www.acsac.org/2023/workshops/pavetrust/) | Austin, Texas, USA (virtual) | 5 December, 2023 | [TBTL](https://tbtl.com/) | [slides](https://www.researchgate.net/publication/376307777_Presentation_Towards_Formal_Specification_and_Verification_of_Attestation_in_Arm_CCA_and_Intel_TDX_PAVeTrust%2723_sponsored_by) |
| [24th International Conference on Formal Engineering Methods (ICFEM 2023)](https://formal-analysis.com/icfem/2023/) | Brisbane, Australia | 21-24 November, 2023 | Partly by [TBTL](https://tbtl.com/); looking for sponsors  | [slides](https://www.researchgate.net/publication/375991694_Presentation_Perspicuity_of_Attestation_Mechanisms_in_Confidential_Computing)  |
| [IETF 118](https://www.ietf.org/how/meetings/118/) | Prague, Czechia | 4-10 November, 2023 | [CPEC](https://www.perspicuous-computing.science/) (Mini-project) | [slides](https://datatracker.ietf.org/meeting/118/materials/slides-118-rats-formal-specification-of-attestation-in-confidential-computing-01) |
| [Hardware and Architectural Support for Security and Privacy (HASP) 2023](https://www.haspworkshop.org/2023/index.html) | Toronto, Canada (Virtual) | 29 October, 2023 | [Flashbots](https://www.flashbots.net/) | [slides](https://www.researchgate.net/publication/375083601_Presentation_Formal_Specification_and_Verification_of_Attestation_in_Confidential_Computing) |
| ~~[Formal Methods in Computer-Aided Design (FMCAD) 2023](https://fmcad.org/FMCAD23/)~~ | ~~Ames, Iowa, USA~~ | ~~23-27 October, 2023~~ | ~~[FMCAD Association](https://fmcad.or.at/)~~ | Visa delayed |
| [Confidential Computing Mini Summit (co-located with OSS EU)](https://events.linuxfoundation.org/open-source-summit-europe/features/co-located-events/#confidential-computing-mini-summit) | Bilbao, Spain | 18 September, 2023 | [CCC](https://confidentialcomputing.io/) | [slides](https://www.researchgate.net/publication/374002611_Presentation_Formal_Specification_and_Verification_of_Attestation_in_Confidential_Computing)  [video](https://www.youtube.com/watch?v=B8_RcCBLsHA)|
| CCC SIG Progress update| Virtual | 12 September, 2023 | - | [slides](https://www.researchgate.net/publication/373873503_Presentation_Formal_Specification_and_Verification_of_Architecturally-defined_Attestation_in_Confidential_Computing) [video](https://youtu.be/O50PN9aRgZY?list=PLmfkUJc39uMhZsNGmpx-qD-uCoQyMglIp&t=763) |
| Research visit at [University of Edinburgh](https://www.ed.ac.uk/) and [Heriot-Watt University](https://www.hw.ac.uk/) | Edinburgh, UK | 11-13 September, 2023 | [EuroProofNet](https://europroofnet.github.io/) | - |
| [16th Conference on Intelligent Computer Mathematics (CICM)](https://cicm-conference.org/2023/cicm.php?event=&menu=general) | Cambridge, UK (Virtual) | 6 September, 2023 |  | [slides](https://www.researchgate.net/publication/373707043_Presentation_Formal_Specification_and_Verification_of_Attestation_in_Confidential_Computing) |
| [Highlights of Logic, Games and Automata](https://highlights-conference.org/2023/) | Kassel, Germany | 28 July, 2023 | [Secretarium](https://secretarium.com/) |  [slides](https://www.researchgate.net/publication/372746716_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing)| 
| [Output](https://output-dd.de/) | Dresden, Germany | 29 June, 2023 | - | [slides](https://www.researchgate.net/publication/371948775_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [Formal Methods for Security Network](https://fmsec.github.io/fmsec/) and [Cyber Security & Privacy Seminar Series](https://uk-sps.org/seminars/)| Virtual | 28 June, 2023 | - | [slides](https://www.researchgate.net/publication/371936296_Comprehensive_Specification_and_Formal_Analysis_ofAttestation_Mechanisms_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=ZS_9Hs4V2WE&ab_channel=UK-SPS) |
| [16th Interaction and Concurrency Experience (ICE)](https://www.discotec.org/2023/ice) | Lisbon, Portugal | 19 June, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/371762135_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [OCP Security](https://www.opencompute.org/wiki/Security) | Virtual | 13 June, 2023 | - | [slides](https://www.researchgate.net/publication/371562452_Presentation_Specification_and_Formal_Verification_of_Attestation_Mechanisms_in_Confidential_Computing)  [video](https://www.youtube.com/watch?v=5WXPcGKxlYc)|
| CCC SIG Progress update| Virtual | 6 June, 2023 | - | [slides](https://www.researchgate.net/publication/371339782_Presentation_Formal_Specification_of_Attestation_Mechanisms_in_Confidential_Computing_Progress_Update) [video](https://youtu.be/CeqfKEP8W4U?list=PLmfkUJc39uMhZsNGmpx-qD-uCoQyMglIp&t=1048)|
| [IEEE Symposium on Security and Privacy (SnP)](https://sp2023.ieee-security.org/index.html) | San Francisco, USA | 22-24 May, 2023 | [TBTL](https://tbtl.com/), [Flashbots](https://www.flashbots.net/) and [konVera](https://konvera.io/)| [slides](https://www.researchgate.net/publication/371034944_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [Heriot-Watt University](https://www.hw.ac.uk/): [Joining details](https://ittgroup.org/seminars/) | Edinburgh, UK | 17 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370838319_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [University of Edinburgh](https://www.ed.ac.uk/): [Joining details](https://web.inf.ed.ac.uk/lfcs/events/lfcs-seminars/lfcs-seminars-2023/lfcs-seminar-tuesday-16-may-u-sardar) | Edinburgh, UK | 16 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370844935_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=hqkXtGUpLUk)|
| [2023 OCP Regional Summit](https://2023ocpregional.fnvirtual.app/) | Prague, Czech Republic | 20 April, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/370131511_Presentation_Systemization_of_Knowledge_Attestation_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=pJXvKvJVHt8)|
| [NSA Symposium on Hot Topics in the Science of Security (HotSoS)](https://cps-vo.org/group/hotsos) | Virtual | 3-5 April, 2023 | - | [slides](https://www.researchgate.net/publication/369794583_Presentation_SoK_Attestation_in_Confidential_Computing) |
| [2023 Annual Meeting of the WG "Formal Methods for Security"](https://gtmfs2023.sciencesconf.org/) | Roscoff, France | 28-30 Mar, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369626152_SoK_Attestation_in_Confidential_Computing) |
| Invited talk at [CISPA Helmholtz Center for Information Security](https://cispa.de/en) | Saarbrücken, Germany | 15 Mar, 2023| [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369375426_Presentation_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [University of Luxembourg](https://wwwen.uni.lu/) | Luxembourg | 13-14 Mar, 2023 | [CritiX](https://wwwfr.uni.lu/snt/research/critix) @ [University of Luxembourg](https://wwwen.uni.lu/)| [slides](https://www.researchgate.net/publication/369227453_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [WG3 Program Verification Meeting](https://europroofnet.github.io/wg3-timisoara/) of [EuroProofNet](https://europroofnet.github.io/) | Timisoara, Romania | 8-9 Feb, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/368543273_Presentation_Tools_and_Techniques_for_Symbolic_Protocol_Verification) |

## Feedback/Comments/Critique/Contributions
We would love to have your feedback (especially critique! yes, this is how the science progresses, but please be genuine!) and contributions. Contact [Muhammad Usama Sardar](https://tu-dresden.de/ing/informatik/sya/se/die-professur/beschaeftigte/muhammad-usama-sardar) on CCC Slack Workspace, or by email, or open an issue. 

## Notes

[^1]:
     Arm has internally [verified](https://dl.acm.org/doi/10.1145/3586040) the security and safety properties of both the specification and a prototype implementation of the RMM using HOL4 theorem prover and CBMC model checker. However, this work does not cover attestation mechanisms.
