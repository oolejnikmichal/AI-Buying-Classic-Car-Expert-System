
;;;======================================================
;;;     Choose a channel to watch on YouTube - System
;;;
;;;     Based on CLIPS Version 6.3 Example: Auto
;;;
;;;		Made by: 148210 and 148229
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-why-do-you-want-a-classic ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted why-do-you-want-a-classic)
                     (response ReliabilityAndConvenience)
                     (valid-answers ReliabilityAndConvenience IGuessImMakingSomeKindOfStatementAboutSomething NewCarsHaveNoSoul IPreferTheStyle LoveSpeedHateSafety))))

(defrule determine-erotically-drawn-know-how-cars-work ""

   (logical (why-do-you-want-a-classic ReliabilityAndConvenience))

   =>

   (assert (UI-state (display OhYeahWhyIsThat)
                     (relation-asserted erotically-drawn-know-how-cars-work)
                     (response IWantToKnowHowCarsWork)
                     (valid-answers IWantToKnowHowCarsWork ImEroticallyDrawnToTowTrucksAndFreewayShoulders))))

(defrule determine-more-archaic-sounds-good-not-that-archaic ""

   (logical (erotically-drawn-know-how-cars-work IWantToKnowHowCarsWork))

   =>

   (assert (UI-state (display SoSomethingReallySimple)
                     (relation-asserted more-archaic-sounds-good-not-that-archaic)
                     (response SoundsGood)
                     (valid-answers SoundsGood MoreArchaic NotThatArchaic))))

(defrule determine-also-really-lovely ""

   (logical (erotically-drawn-know-how-cars-work ImEroticallyDrawnToTowTrucksAndFreewayShoulders))

   =>

   (assert (UI-state (display OkShouldItBePrettyQuick)
                     (relation-asserted also-really-lovely)
                     (response AlsoReallyLovely)
                     (valid-answers AlsoReallyLovely Yes))))


(defrule determine-dziesiec-odpowiedzi-ogien ""

   (logical (why-do-you-want-a-classic IGuessImMakingSomeKindOfStatementAboutSomething))

   =>

   (assert (UI-state (display GreatWhatStatement)
                     (relation-asserted dziesiec-odpowiedzi-ogien)
                     (response ImReallyRichButLikeToPretendImStillAHippie)
                     (valid-answers ImReallyRichButLikeToPretendImStillAHippie TheMothershipLeftMeInParis IRunAnNyc-ThemedDinerInLasVegas ILiveDangerouslyAndNaderCanSuckIt IWillOnlyDriveVehiclesWithTwoDistinctLugageAreas ImAKookAnAmericanKook ITakeDrivingSeriouslyAndHaveTheGlovesToProveIt MyWalletIsOnChain ImARefugeeeFromAnAlternateFutureWithZeppelinsAndShit ILikeBeingPartOfAMassiveAutomotiveSubculture IHatePeopleKnowingWhatIDrive IKindaWantedAMotorcycleButIHaveNoBalance))))

(defrule determine-is-vw-type-fast-enough ""

   (logical (dziesiec-odpowiedzi-ogien IWillOnlyDriveVehiclesWithTwoDistinctLugageAreas))

   =>

   (assert (UI-state (display IsVwTypeIIIFastEnoughForYou)
                     (relation-asserted is-vw-type-fast-enough)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule determine-is-porshe-fast-enough ""

   (logical (is-vw-type-fast-enough No))

   =>

   (assert (UI-state (display IsPorshe914FastEnoughForYou)
                     (relation-asserted is-porshe-fast-enough)
                     (response Yes)
                     (valid-answers Yes No))))


(defrule conclusions-more-archaic-sounds-good-not-that-archaic-soundsgood ""

   (logical (more-archaic-sounds-good-not-that-archaic SoundsGood))
   
   =>

   (assert (UI-state (display AnswerCitroen2CV)
                     (state final))))

(defrule conclusions-more-archaic-sounds-good-not-that-archaic-morearchaic ""

   (logical (more-archaic-sounds-good-not-that-archaic MoreArchaic))
   
   =>

   (assert (UI-state (display AnswerFordModelT)
                     (state final))))

(defrule conclusions-more-archaic-sounds-good-not-that-archaic-morearchaic-notthatarchaic ""

   (logical (more-archaic-sounds-good-not-that-archaic NotThatArchaic))
   
   =>

   (assert (UI-state (display AnswerFordModelA)
                     (state final))))

(defrule conclusions-also-really-lovely-lovely ""

   (logical (also-really-lovely AlsoReallyLovely))
   
   =>

   (assert (UI-state (display AnswerAlfaRomeoGiuliaSuper)
                     (state final))))

(defrule conclusions-also-really-lovely-yes ""

   (logical (also-really-lovely Yes))
   
   =>

   (assert (UI-state (display AnswerLotusElan)
                     (state final))))



(defrule conclusions-dziesiec-odpowiedzi-ogien-reallyrich ""

   (logical (dziesiec-odpowiedzi-ogien ImReallyRichButLikeToPretendImStillAHippie))
   
   =>

   (assert (UI-state (display AnswerVWType2Microbus)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-mothership ""

   (logical (dziesiec-odpowiedzi-ogien TheMothershipLeftMeInParis))
   
   =>

   (assert (UI-state (display AnswerCitreonSM)
                     (state final))))

(defrule conclusions-dziesiec-odpowiedzi-ogien-dinerinlasvegas ""

   (logical (dziesiec-odpowiedzi-ogien IRunAnNyc-ThemedDinerInLasVegas))
   
   =>

   (assert (UI-state (display AnswerCheckerMarathon)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-dangerandnader ""

   (logical (dziesiec-odpowiedzi-ogien ILiveDangerouslyAndNaderCanSuckIt))
   
   =>

   (assert (UI-state (display AnswerChevyCorvair)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-americankook ""

   (logical (dziesiec-odpowiedzi-ogien ImAKookAnAmericanKook))
   
   =>

   (assert (UI-state (display AnswerAmcAmx )
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-drivingseriously ""

   (logical (dziesiec-odpowiedzi-ogien ITakeDrivingSeriouslyAndHaveTheGlovesToProveIt))
   
   =>

   (assert (UI-state (display AnswerBmwE30)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-refugee ""

   (logical (dziesiec-odpowiedzi-ogien ImARefugeeeFromAnAlternateFutureWithZeppelinsAndShit))
   
   =>

   (assert (UI-state (display AnswerTatraTb7)
                     (state final))))

(defrule conclusions-dziesiec-odpowiedzi-ogien-massivesubculture ""

   (logical (dziesiec-odpowiedzi-ogien ILikeBeingPartOfAMassiveAutomotiveSubculture))
   
   =>

   (assert (UI-state (display AnswerVWBeetle)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-hatepeople ""

   (logical (dziesiec-odpowiedzi-ogien IHatePeopleKnowingWhatIDrive))
   
   =>

   (assert (UI-state (display AnswerSterlingB25)
                     (state final))))

(defrule conclusions-dziesiec-odpowiedzi-ogien-kindawanted ""
   (logical (dziesiec-odpowiedzi-ogien IKindaWantedAMotorcycleButIHaveNoBalance))
   
   =>

   (assert (UI-state (display AnswerLotus7)
                     (state final))))


(defrule conclusions-is-vw-type-fast-enough-yes ""
   (logical (is-vw-type-fast-enough Yes))
   
   =>

   (assert (UI-state (display AnswerVwTypeIII)
                     (state final))))


(defrule conclusions-is-porshe-fast-enough-yes ""
   (logical (is-porshe-fast-enough Yes))
   
   =>

   (assert (UI-state (display AnswerPorshe914)
                     (state final))))

(defrule conclusions-is-porshe-fast-enough-no ""
   (logical (is-porshe-fast-enough No))
   
   =>

   (assert (UI-state (display AnswerDeTomasoMangusta)
                     (state final))))


(defrule conclusions-dziesiec-odpowiedzi-ogien-wallet ""

   (logical (dziesiec-odpowiedzi-ogien MyWalletIsOnChain))
   
   =>

   (assert (UI-state (display AnswerFordFalcon)
                     (state final))))



(defrule determine-soul-meaning ""

   (logical (why-do-you-want-a-classic NewCarsHaveNoSoul))

   =>

   (assert (UI-state (display WhatDoesSoulMeanToYou)
                     (relation-asserted soul-meaning)
                     (response EasyAbilityToDriveOffaPierIntoAnEstuary)
                     (valid-answers EasyAbilityToDriveOffaPierIntoAnEstuary SynonymForWeird TechnicallyNovel SoulMeansTheCarHadAnHonestJobLikeACopOrCabbie ItMeansRidingInItIsLikeSittingOnASofa ItMeansTheCarIsOftenStarringInMovies ItCouldMeanPureEvil SoulIsTheSpiritsOf43DeadClownsHauntingTheCar SouldIsTheAbilityToGoAMillionMilesWithSuCarbsAndLucasElectrics))))

(defrule determine-like-what ""

   (logical (soul-meaning TechnicallyNovel))

   =>

   (assert (UI-state (display LikeWhat)
                     (relation-asserted like-what)
                     (response InsteadOfPistonsSomeMetalHamantaschen)
                     (valid-answers InsteadOfPistonsSomeMetalHamantaschen CanBurnBookingOil EngineInTheWrongPlace TheyThoughtTheyWereBuildingAPlane))))

(defrule determine-huge-fast-sofa ""

   (logical (soul-meaning ItMeansRidingInItIsLikeSittingOnASofa))

   =>

   (assert (UI-state (display AHugeFastFWDSofa)
                     (relation-asserted huge-fast-sofa)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule conclusions-huge-fast-sofa-y ""

   (logical (huge-fast-sofa Yes))
   
   =>

   (assert (UI-state (display AnswerOldsToronado)
                     (state final))))

(defrule conclusions-huge-fast-sofa-n ""

   (logical (huge-fast-sofa No))
   
   =>

   (assert (UI-state (display AnswerLincolnTownCar)
                     (state final))))

(defrule conclusions-easy-ability ""

   (logical (soul-meaning EasyAbilityToDriveOffaPierIntoAnEstuary))
   
   =>

   (assert (UI-state (display AnswerAmphicar)
                     (state final))))

(defrule conclusions-synonym-weird ""

   (logical (soul-meaning SynonymForWeird))
   
   =>

   (assert (UI-state (display AnswerBMWISetta)
                     (state final))))

(defrule conclusions-honest-job ""

   (logical (soul-meaning SoulMeansTheCarHadAnHonestJobLikeACopOrCabbie))
   
   =>

   (assert (UI-state (display AnswerChevyCaprice)
                     (state final))))

(defrule conclusions-starring-movies ""

   (logical (soul-meaning ItMeansTheCarIsOftenStarringInMovies))
   
   =>

   (assert (UI-state (display AnswerDelorean)
                     (state final))))

(defrule conclusions-pure-evil ""

   (logical (soul-meaning ItCouldMeanPureEvil))
   
   =>

   (assert (UI-state (display AnswerBuickGNX)
                     (state final))))

(defrule conclusions-dead-clowns ""

   (logical (soul-meaning SoulIsTheSpiritsOf43DeadClownsHauntingTheCar))
   
   =>

   (assert (UI-state (display AnswerNashMetro)
                     (state final))))

(defrule conclusions-million-miles ""

   (logical (soul-meaning SouldIsTheAbilityToGoAMillionMilesWithSuCarbsAndLucasElectrics))
   
   =>

   (assert (UI-state (display AnswerVolvoP1800)
                     (state final))))

(defrule conclusions-intead-pistons ""

   (logical (like-what InsteadOfPistonsSomeMetalHamantaschen))
   
   =>

   (assert (UI-state (display AnswerMazdaRX7)
                     (state final))))

(defrule conclusions-burn-oil ""

   (logical (like-what CanBurnBookingOil))
   
   =>

   (assert (UI-state (display AnswerMercedesBezn300TD)
                     (state final))))

(defrule conclusions-engine-place ""

   (logical (like-what EngineInTheWrongPlace))
   
   =>

   (assert (UI-state (display AnswerPorsche912)
                     (state final))))

(defrule conclusions-building-plane ""

   (logical (like-what TheyThoughtTheyWereBuildingAPlane))
   
   =>

   (assert (UI-state (display AnswerSaab96)
                     (state final))))

(defrule determine-kind-of-style ""

   (logical (why-do-you-want-a-classic IPreferTheStyle))

   =>

   (assert (UI-state (display OKWhatKindOfStyle)
                     (relation-asserted kind-of-style)
                     (response AfricanDictator)
                     (valid-answers AfricanDictator ILoveCorairsButLiveInA34ScaleUniverse LikeBuckBogersBosssDad ILoveChromeAndLoudShirts ReallySlowCarsThatLookFast ILoveBrassAndLanters ICanOnlyDriveCarsThatAreMuseumWorthy WorkingClassHeroAlsoBeer ClassicGermanWithATouchOfPedalConfusion))))

(defrule conclusions-african-dictator ""

   (logical (kind-of-style AfricanDictator))
   
   =>

   (assert (UI-state (display AnswerMercedesBenz600)
                     (state final))))

(defrule conclusions-scale-34-universe ""

   (logical (kind-of-style ILoveCorairsButLiveInA34ScaleUniverse))
   
   =>

   (assert (UI-state (display AnswerNSUPrinz)
                     (state final))))

(defrule conclusions-buck-rogers ""

   (logical (kind-of-style LikeBuckBogersBosssDad))
   
   =>

   (assert (UI-state (display Answer59CadillacEldorado)
                     (state final))))

(defrule conclusions-chrome-loud ""

   (logical (kind-of-style ILoveChromeAndLoudShirts))
   
   =>

   (assert (UI-state (display Answer57ChevyBelAir)
                     (state final))))

(defrule conclusions-slow-look-fast ""

   (logical (kind-of-style ReallySlowCarsThatLookFast))
   
   =>

   (assert (UI-state (display AnswerOpelGT)
                     (state final))))

(defrule conclusions-brass-lanterns ""

   (logical (kind-of-style ILoveBrassAndLanters))
   
   =>

   (assert (UI-state (display AnswerAnythingPreWWII)
                     (state final))))

(defrule conclusions-museum-worthy ""

   (logical (kind-of-style ICanOnlyDriveCarsThatAreMuseumWorthy))
   
   =>

   (assert (UI-state (display AnswerCitroenDS)
                     (state final))))

(defrule conclusions-pedal-confusion ""

   (logical (kind-of-style ClassicGermanWithATouchOfPedalConfusion))
   
   =>

   (assert (UI-state (display AnswerAudi100)
                     (state final))))

(defrule determine-hat-says ""

   (logical (kind-of-style WorkingClassHeroAlsoBeer))

   =>

   (assert (UI-state (display DoesYourHatSayYoudRatherPushAChevy)
                     (relation-asserted hat-says)
                     (response Yes)
                     (valid-answers Yes No))))

(defrule conclusions-hat-says-y ""

   (logical (hat-says Yes))
   
   =>

   (assert (UI-state (display AnswerChevyCamaro)
                     (state final))))

(defrule conclusions-hat-says-n ""

   (logical (hat-says No))
   
   =>

   (assert (UI-state (display AnswerFordMustang)
                     (state final))))

(defrule determine-real-speed ""

   (logical (why-do-you-want-a-classic LoveSpeedHateSafety))

   =>

   (assert (UI-state (display RealSpeedOrJustFeelsSpeedy)
                     (relation-asserted real-speed)
                     (response ILoveSpeedAndMoney)
                     (valid-answers ILoveSpeedAndMoney IHaveADeathWish FastAndCheap FakeIsFine))))

(defrule determine-who-are-you ""

   (logical (real-speed ILoveSpeedAndMoney))

   =>

   (assert (UI-state (display GreatWhoAreYou)
                     (relation-asserted who-are-you)
                     (response SomeKindOfDukeAndIRally)
                     (valid-answers SomeKindOfDukeAndIRally MyGoalIsToDriveMYChildhoodBedroomPosters IHaveAWeirdFetishWhereILikePeopleAskingReplica))))

(defrule conclusions-kind-duke ""

   (logical (who-are-you SomeKindOfDukeAndIRally))
   
   =>

   (assert (UI-state (display AnswerLanciaStratos)
                     (state final))))

(defrule conclusions-childhood-dream ""

   (logical (who-are-you MyGoalIsToDriveMYChildhoodBedroomPosters))
   
   =>

   (assert (UI-state (display AnswerLamborghiniCountach)
                     (state final))))

(defrule conclusions-weird-fetish ""

   (logical (who-are-you IHaveAWeirdFetishWhereILikePeopleAskingReplica))
   
   =>

   (assert (UI-state (display AnswerACCobra)
                     (state final))))

(defrule determine-how-to-go ""

   (logical (real-speed IHaveADeathWish))

   =>

   (assert (UI-state (display HowDoYouWantToGo)
                     (relation-asserted how-to-go)
                     (response ElectrocutedByWiperSwitch)
                     (valid-answers ElectrocutedByWiperSwitch BlazeOfGlory CarTree RunOutOfTalentOffCliff))))

(defrule conclusions-electrocuted ""

   (logical (how-to-go ElectrocutedByWiperSwitch))
   
   =>

   (assert (UI-state (display AnswerJaguarEType)
                     (state final))))

(defrule conclusions-blaze-of-glory ""

   (logical (how-to-go BlazeOfGlory))
   
   =>

   (assert (UI-state (display AnswerFerrariTestarossa)
                     (state final))))

(defrule conclusions-car-tree ""

   (logical (how-to-go CarTree))
   
   =>

   (assert (UI-state (display AnswerCamaroIROCZ)
                     (state final))))

(defrule conclusions-run-talent ""

   (logical (how-to-go RunOutOfTalentOffCliff))
   
   =>

   (assert (UI-state (display AnswerPorscheSpyder)
                     (state final))))

(defrule conclusions-fast-cheap ""

   (logical (real-speed FastAndCheap))
   
   =>

   (assert (UI-state (display AnswerDodgeDMNIGLH)
                     (state final))))

(defrule conclusions-fake-is-fine ""

   (logical (real-speed FakeIsFine))
   
   =>

   (assert (UI-state (display AnswerDatsun510)
                     (state final))))





















(defrule no-repairs ""

   (declare (salience -10))
  
   (logical (UI-state (id ?id)))
   
   (state-list (current ?id))
     
   =>
  
   (assert (UI-state (display NoResult)
                     (state final))))














                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))