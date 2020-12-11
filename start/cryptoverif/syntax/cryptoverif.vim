" Name:        CryptoVerif
" Author:      Lifepillar <lifepillar@lifepillar.me>
" Maintainer:  Lifepillar <lifepillar@lifepillar.me>
" License:     Vim license (see `:help license`)

if exists("b:current_syntax")
  finish
endif

syn sync minlines=100
syn case match
syn iskeyword @,48-57,192-255,_,'

syn keyword cryptoverifKeyword builtin channel collision const def defined do else eps_find
syn keyword cryptoverifKeyword eps_rand equation equiv equivalence event event_abort expand find
syn keyword cryptoverifKeyword forall foreach fun get if implementation in inf insert length
syn keyword cryptoverifKeyword let letfun max maxlength new newChannel newOracle orfind out param Pcoll1rand
syn keyword cryptoverifKeyword Pcoll2rand proba process proof public_vars query query_equiv return run
syn keyword cryptoverifKeyword secret set special suchthat table then time type yield
syn match   cryptoverifKeyword /\<inj-event\>/
syn match   cryptoverifKeyword /\<independent-of\>/

syn keyword cryptoverifIdentifier AC ACU ACUN assoc assocU commut commut_group group
" TODO: put length, max, maxlength here?
syn keyword cryptoverifFunction AEAD AEAD_INDdollar_CPA AEAD_INDdollar_CPA_all_args AEAD_INDdollar_CPA_nonce
syn keyword cryptoverifFunction AEAD_all_args AEAD_from_AEAD_nonce AEAD_from_Enc_then_MAC AEAD_nonce
syn keyword cryptoverifFunction AEAD_nonce_all_args Auth_Enc_from_AEAD Auth_Enc_from_AEAD_nonce
syn keyword cryptoverifFunction AuthEnc_from_AEAD_nonce AuthEnc_from_AEAD Auth_Enc_from_Enc_then_MAC
syn keyword cryptoverifFunction CollisionResistant_hash DH_X25519 DH_X448
syn keyword cryptoverifFunction DH_dist_random_group_element_vs_exponent DH_basic DH_proba_collision
syn keyword cryptoverifFunction square_DH_proba_collision DH_good_group FixedPreimageResistant_hash
syn keyword cryptoverifFunction FixedPreimageResistant_hash_all_args FixedSecondPreimageResistant_hash
syn keyword cryptoverifFunction HiddenKeyCollisionResistant_hash HiddenKeyPreimageResistant_hash ind_cca2
syn keyword cryptoverifFunction HiddenKeyPreimageResistant_hash_all_args HiddenKeySecondPreimageResistant_hash
syn keyword cryptoverifFunction IND_CCA2_INT_PTXT_sym_enc_all_args IND_CCA2_public_key_enc_all_args
syn keyword cryptoverifFunction IND_CCA2_sym_enc IND_CPA_INT_CTXT_sym_enc IND_CPA_INT_CTXT_sym_enc_all_args
syn keyword cryptoverifFunction IND_CPA_INT_CTXT_sym_enc_nonce IND_CPA_INT_CTXT_sym_enc_nonce_all_args
syn keyword cryptoverifFunction IND_CPA_sym_enc IND_CPA_sym_enc_all_args IND_CPA_sym_enc_nonce
syn keyword cryptoverifFunction IND_CPA_sym_enc_nonce_all_args INDdollar_CPA_INT_CTXT_sym_enc
syn keyword cryptoverifFunction INDdollar_CPA_INT_CTXT_sym_enc_all_args INDdollar_CPA_INT_CTXT_sym_enc_nonce
syn keyword cryptoverifFunction INDdollar_CPA_sym_enc INDdollar_CPA_sym_enc_all_args
syn keyword cryptoverifFunction INDdollar_CPA_sym_enc_nonce INT_PTXT_sym_enc_all_args
syn keyword cryptoverifFunction IND_CCA2_INT_PTXT_sym_enc OW_trapdoor_perm remove_invf OW_trapdoor_perm_RSR
syn keyword cryptoverifFunction OW_trapdoor_perm_RSR_all_args PRF_ODH2 PRF_large PRP_cipher ICM_cipher
syn keyword cryptoverifFunction SUF_CMA_det_mac PreimageResistant_hash ind_cpa int_ctxt
syn keyword cryptoverifFunction PreimageResistant_hash_all_args ROM_hash ROM_hash_large SPRP_cipher
syn keyword cryptoverifFunction SUF_CMA_det_mac_all_args SUF_CMA_det_signature SUF_CMA_det_signature_all_args
syn keyword cryptoverifFunction SUF_CMA_proba_mac SUF_CMA_proba_mac_all_args IND_CCA2_public_key_enc
syn keyword cryptoverifFunction SUF_CMA_proba_signature SUF_CMA_proba_signature_all_args
syn keyword cryptoverifFunction SecondPreimageResistant_hash UF_CMA_det_signature
syn keyword cryptoverifFunction UF_CMA_det_signature_all_args UF_CMA_proba_mac UF_CMA_proba_mac_all_args
syn keyword cryptoverifFunction UF_CMA_proba_signature UF_CMA_proba_signature_all_args collision_res
syn keyword cryptoverifFunction second_pre_res preimage_res exclude_weak_keys group_to_exp CDH CDH_RSR DDH GDH
syn keyword cryptoverifFunction GDH_RSR gdh ddh cdh group_to_exp exp_to_group DH_single_coord_ladder
syn keyword cryptoverifFunction group_to_exp_strict group_to_exp_strict ind_cca2_after_int_ptxt
syn keyword cryptoverifFunction ind_cca2_partial int_ptxt int_ptxt_after_ind_cca2 inddollar_cpa
syn keyword cryptoverifFunction ind_cca2_partial int_ptxt int_ctxt_corrupt int_ptxt_corrupt_partial
syn keyword cryptoverifFunction int_ptxt_corrupt_partial not prf_odh square_PRF_ODH1 square_PRF_ODH2 Xor
syn keyword cryptoverifFunction remove_xor keygen set_PD_OW_trapdoor_perm OW_trapdoor_perm_all_args
syn keyword cryptoverifFunction set_PD_OW_trapdoor_perm_all_args PRF prf sprp suf_cma suf_cma_corrupt
syn keyword cryptoverifFunction suf_cma_corrupt_partial square_CDH square_CDH_RSR square_DDH square_GDH
syn keyword cryptoverifFunction square_GDH_RSR PRF_ODH1 suf_cma_corrupt_partial uf_cma uf_cma_corrupt
syn keyword cryptoverifFunction uf_cma_corrupt_partial suf_cma suf_cma_corrupt

syn keyword cryptoverifCommand auto crypto

syn match   cryptoverifMacroDef /\<exp'_to_group\>/

syn keyword cryptoverifConstant bottom false true
syn match cryptoverifConstant "\<0\>\|[.;]"

syn match cryptoverifOperator "[:!=/*+-]"
syn match cryptoverifOperator "&&\|||\|<>"
syn match cryptoverifOperator "==>\|<->\|<-R\?\|<=\|->\|<=>"
syn match cryptoverifDelimiter "[[\]\|(){}]"

syn region cryptoverifOption matchgroup=cryptoverifDelimiter start=/\[/ end=/]/ contains=cryptoverifOptionValue
syn keyword cryptoverifOptionValue contained all bounded compos computational cv_onesession cv_real_or_random data default exist fixed large manual noninteractive nonuniform
syn keyword cryptoverifOptionValue contained onesession passive password projection random_choices_may_be_equal real_or_random small unchanged uniform unique useful_change
syn match   cryptoverifOptionValue contained /\<\%(pest\|pcoll\)\d\+\>/
syn match   cryptoverifOptionValue contained /\<size\d\+\%(_\d\+\)\=\>/
syn match   cryptoverifOptionValue contained /\<pv\k\+\>/

syn keyword cryptoverifType bitstring bitstringbot bool

syn region cryptoverifSettings matchgroup=cryptoverifKeyword start=/\<set\>/ end=/\./ contains=cryptoverifSetting,cryptoverifSettingValue,cryptoverifOperator keepend

syn keyword cryptoverifSetting contained allowUndefinedVar autoAdvice noAdviceGlobalDepAnal autoMergeArrays
syn keyword cryptoverifSetting contained autoMergeBranches autoExpand autoMove autoRemoveAssignFindCond
syn keyword cryptoverifSetting contained autoRemoveIfFindCond autoSARename backtrackOnCrypto casesInCorresp
syn keyword cryptoverifSetting contained constantsNotTuple diffConstants elsefindAdditionalDisjunct
syn keyword cryptoverifSetting contained elsefindFactsInReplace elsefindFactsInSimplify elsefindFactsInSuccess
syn keyword cryptoverifSetting contained elsefindFactsInSuccessSimplify expandAssignXY forgetOldGames ignoreSmallTimes
syn keyword cryptoverifSetting contained improvedFactCollection inferUnique interactiveMode maxAddFactDepth
syn keyword cryptoverifSetting contained maxAdvicePossibilitiesBeginning maxAdvicePossibilitiesEnd
syn keyword cryptoverifSetting contained maxIterRemoveUselessAssign maxIterSimplif maxReplaceDepth maxTryNoVarDepth
syn keyword cryptoverifSetting contained minAutoCollElim minimalSimplifications noAdviceCrypto optimizeVars
syn keyword cryptoverifSetting contained priorityEventUnchangedRand simplifyAfterSARename uniqueBranch
syn keyword cryptoverifSetting contained uniqueBranchReorganize useEqualitiesInSimplifyingFacts
syn keyword cryptoverifSetting contained useKnownEqualitiesInCryptoTransform useKnownEqualitiesWithFunctionsInMatching

syn keyword cryptoverifSettingValue contained false large password true
syn match   cryptoverifSettingValue contained /\<pest\d\+\>/

syn region cryptoverifProbEquiv matchgroup=cryptoverifOperator start=/<=(/ end=/)=>/ contains=cryptoverifProbFormula

syn region cryptoverifMacro matchgroup=cryptoverifDelimiter start=/{/ end=/}/ keepend contains=ALLBUT,cryptoverifSetting,cryptoverifSettingValue

syn keyword cryptoverifPredicate attacker ev evinj mess

syn keyword cryptoverifTodo contained TODO FIXME XXX DEBUG NOTE
syn region cryptoverifComment matchgroup=cryptoverifComment start=/(\*/ end=/\*)/ contains=cryptoverifTodo keepend

hi def link cryptoverifCommand      Statement
hi def link cryptoverifComment      Comment
hi def link cryptoverifConstant     Constant
hi def link cryptoverifDelimiter    Delimiter
hi def link cryptoverifFunction     Function
hi def link cryptoverifKeyword      Keyword
hi def link cryptoverifIdentifier   Identifier
hi def link cryptoverifOperator     Operator
hi def link cryptoverifOptionValue  StorageClass
hi def link cryptoverifPredicate    Function
hi def link cryptoverifSetting      Debug
hi def link cryptoverifSettingValue Constant
hi def link cryptoverifTodo         Todo
hi def link cryptoverifType         Type

let b:current_syntax = "cryptoverif"

" vim: nowrap et ts=2 sw=2
