# Formal specification of attestation mechanisms in Confidential Computing

This repo will contain the material for formal specification of _architecturally-defined_ remote attestation in the following groups: 

1. _Vendor solutions_: 
	- Intel TDX  
	- AMD SEV-SNP 

2. _Architecture lead solutions_: 
	- Arm CCA

The groups are based on the level of customization possible. 

## Motivation 
The complex attestation mechanisms provided by TEEs are not well-understood. The project aims at better understanding of these mechanisms and the underlying trust assumptions. These mechanisms can then be composed with transport protocols (e.g., TLS) to build attestation _frameworks_.

## Main Challenge
The main challenge is the extraction of the protocol to be formalized, as the vendors typically describe the protocols informally. 

## Approach 
We use state-of-the-art symbolic security analysis tool [ProVerif](https://ieeexplore.ieee.org/document/9833653) for the specification of the protocols. 

## Limitations
The symbolic security analysis has the following inherent limitations:
1. Cryptographic primitives (hash, encryption, MAC, digital signatures) are assumed to be perfect. 
2. Side-channels are out of scope. 

## Progress so far 
[This draft](https://www.researchgate.net/publication/367284929_SoK_Attestation_in_Confidential_Computing) co-authored by Thomas Fossati and Simon Frost presents the progress so far. We would like to thank Nikolaus Thümmel (Scontain), Shale Xiong (Arm), Ante Derek (Univeristy of Zagreb) and Jiewen Yao (Intel) for insightful discussions and helpful feedback.

## Recent and Upcoming Talks
If you are around on any of the following venues of upcoming talks on the project, you are very welcome to join. 

| Event/Host | Venue | Date | Funding | Material |
| --- | --- | --- | --- | --- |
| [Highlights of Logic, Games and Automata](https://highlights-conference.org/2023/) | Kassel, Germany | 24-28 July, 2023 |  |  |
| Invited talk at [Formal Methods for Security Network](https://fmsec.github.io/fmsec/) and [Cyber Security & Privacy Seminar Series](https://uk-sps.org/seminars/)| Virtual | 28 June, 2023 | - |  |
| [16th Interaction and Concurrency Experience](https://www.discotec.org/2023/ice) | Lisbon, Portugal | 19 June, 2023 | [CPEC](https://www.perspicuous-computing.science/) |  |
| [OCP Security](https://www.opencompute.org/wiki/Security) | Virtual | 13 June, 2023 | - |  |
| CCC SIG Progress update| Virtual | 6 June, 2023 | - | [slides](https://www.researchgate.net/publication/371339782_Presentation_Formal_Specification_of_Attestation_Mechanisms_in_Confidential_Computing_Progress_Update) |
| [IEEE Symposium on Security and Privacy (SnP)](https://sp2023.ieee-security.org/index.html) | San Francisco, USA | 22-24 May, 2023 | [TBTL](https://tbtl.com/), [Flashbots](https://www.flashbots.net/) and [konVera](https://konvera.io/)| [slides](https://www.researchgate.net/publication/371034944_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [Heriot-Watt University](https://www.hw.ac.uk/): [Joining details](https://ittgroup.org/seminars/) | Edinburgh, UK | 17 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370838319_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [University of Edinburgh](https://www.ed.ac.uk/): [Joining details](https://web.inf.ed.ac.uk/lfcs/events/lfcs-seminars/lfcs-seminars-2023/lfcs-seminar-tuesday-16-may-u-sardar) | Edinburgh, UK | 16 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370844935_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=hqkXtGUpLUk)|
| [2023 OCP Regional Summit](https://2023ocpregional.fnvirtual.app/) | Prague, Czech Republic | 19-20 April, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/370131511_Presentation_Systemization_of_Knowledge_Attestation_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=pJXvKvJVHt8)|
| [NSA Symposium on Hot Topics in the Science of Security (HotSoS)](https://cps-vo.org/group/hotsos) | Virtual | 3-5 April, 2023 | - | [slides](https://www.researchgate.net/publication/369794583_Presentation_SoK_Attestation_in_Confidential_Computing) |
| [2023 Annual Meeting of the WG "Formal Methods for Security"](https://gtmfs2023.sciencesconf.org/) | Roscoff, France | 28-30 Mar, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369626152_SoK_Attestation_in_Confidential_Computing) |
| [CISPA Helmholtz Center for Information Security](https://cispa.de/en) | Saarbrücken, Germany | 15 Mar, 2023| [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369375426_Presentation_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [University of Luxembourg](https://wwwen.uni.lu/) | Luxembourg | 13-14 Mar, 2023 | [CritiX](https://wwwfr.uni.lu/snt/research/critix) @ [University of Luxembourg](https://wwwen.uni.lu/)| [slides](https://www.researchgate.net/publication/369227453_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [WG3 Program Verification Meeting](https://europroofnet.github.io/wg3-timisoara/) of [EuroProofNet](https://europroofnet.github.io/) | Timisoara, Romania | 8-9 Feb, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/368543273_Presentation_Tools_and_Techniques_for_Symbolic_Protocol_Verification) |

## Feedback/Comments/Critique
We would love to have your feedback (especially critique! yes, this is how the science progresses, but please be genuine!). Contact [Muhammad Usama Sardar](https://tu-dresden.de/ing/informatik/sya/se/die-professur/beschaeftigte/muhammad-usama-sardar) on CCC Slack Workspace, or by email, or open an issue. 
